import React, { useReducer, useState, useEffect } from 'react';

const initialState = {
    startDate: '',
    endDate: '',
    touristsAllowed: '',
    packageName: '',
};

const reducer = (state, action) => {
    switch (action.type) {
        case 'SET_FIELD':
            return { ...state, [action.field]: action.value };
        case 'RESET':
            return initialState;
        default:
            return state;
    }
};

const TripsRegister = () => {
    const [state, dispatch] = useReducer(reducer, initialState);
    const [msg, setMsg] = useState('');
    const [packages, setPackages] = useState([]);
    const [errors, setErrors] = useState({});

    useEffect(() => {
        const fetchPackages = async () => {
            try {
                const response = await fetch('http://localhost:8080/getpackages');
                if (!response.ok) {
                    throw new Error('Failed to fetch packages');
                }
                const data = await response.json();
                setPackages(data);
            } catch (error) {
                console.error('Error fetching packages:', error);
                setMsg('Failed to fetch packages. Please try again later.');
            }
        };
        fetchPackages();
    }, []);

    const validate = () => {
        const newErrors = {};

        if (!state.startDate) newErrors.startDate = 'Start Date is required';
        if (!state.endDate) newErrors.endDate = 'End Date is required';
        if (state.startDate && state.endDate && new Date(state.endDate) < new Date(state.startDate)) {
            newErrors.endDate = 'End Date must be later than or equal to Start Date';
        }
        if (!state.touristsAllowed || state.touristsAllowed <= 0) {
            newErrors.touristsAllowed = 'Number of tourists must be greater than 0';
        }
        if (!state.packageName) newErrors.packageName = 'Please select a package';

        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!validate()) return;

        try {
            const response = await fetch('http://localhost:8080/addtripsDetails', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ ...state, touristsAllowed: Number(state.touristsAllowed) }),
            });

            if (!response.ok) {
                throw new Error('Failed to submit details');
            }

            const data = await response.json();
            console.log('Details submitted successfully:', data);
            setMsg('Details submitted successfully!');
            dispatch({ type: 'RESET' });
        } catch (error) {
            console.error('Error:', error);
            setMsg('Failed to submit details. Please try again later.');
        }
    };

    return (
        <div className="container mt-5 d-flex justify-content-center">
            <div className="col-lg-5 col-md-6 col-sm-8 col-12">
                <h2 className="text-center mb-4">Add Trip Details</h2>
                
                <form onSubmit={handleSubmit} className="p-4 border rounded bg-light">
                    <div className="mb-3">
                        <label htmlFor="packageSelect" className="form-label">Select Package</label>
                        <select
                            id="packageSelect"
                            className={`form-select ${errors.packageName ? 'is-invalid' : ''}`}
                            value={state.packageName}
                            onChange={(e) => dispatch({ type: 'SET_FIELD', field: 'packageName', value: e.target.value })}
                        >
                            <option value="">Select a Package</option>
                            {packages.map((pkg) => (
                                <option key={pkg.id} value={pkg.name}>{pkg.name}</option>
                            ))}
                        </select>
                        {errors.packageName && <div className="invalid-feedback">{errors.packageName}</div>}
                    </div>
                    <div className="mb-3">
                        <label htmlFor="startDate" className="form-label">Start Date</label>
                        <input
                            type="date"
                            id="startDate"
                            className={`form-control ${errors.startDate ? 'is-invalid' : ''}`}
                            value={state.startDate}
                            onChange={(e) => dispatch({ type: 'SET_FIELD', field: 'startDate', value: e.target.value })}
                        />
                        {errors.startDate && <div className="invalid-feedback">{errors.startDate}</div>}
                    </div>
                    <div className="mb-3">
                        <label htmlFor="endDate" className="form-label">End Date</label>
                        <input
                            type="date"
                            id="endDate"
                            className={`form-control ${errors.endDate ? 'is-invalid' : ''}`}
                            value={state.endDate}
                            onChange={(e) => dispatch({ type: 'SET_FIELD', field: 'endDate', value: e.target.value })}
                        />
                        {errors.endDate && <div className="invalid-feedback">{errors.endDate}</div>}
                    </div>
                    <div className="mb-3">
                        <label htmlFor="touristsAllowed" className="form-label">Number of Tourists Allowed</label>
                        <input
                            type="number"
                            id="touristsAllowed"
                            className={`form-control ${errors.touristsAllowed ? 'is-invalid' : ''}`}
                            value={state.touristsAllowed}
                            onChange={(e) =>
                                dispatch({ type: 'SET_FIELD', field: 'touristsAllowed', value: Number(e.target.value) })
                            }
                        />
                        {errors.touristsAllowed && <div className="invalid-feedback">{errors.touristsAllowed}</div>}
                    </div>
                    <div className="d-flex justify-content-between">
                        <button type="submit" className="btn btn-warning flex-fill me-2">Submit</button>
                        <button
                            type="button"
                            className="btn btn-warning flex-fill"
                            onClick={() => dispatch({ type: 'RESET' })}
                        >
                            Reset
                        </button>
                    </div>
                    <br />
                    {msg && <div className={`alert ${msg.includes('successfully') ? 'alert-success' : 'alert-danger'}`} role="alert">{msg}</div>}
                </form>
            </div>
        </div>
    );
};

export default TripsRegister;

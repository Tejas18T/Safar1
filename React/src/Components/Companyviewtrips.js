import { useState } from "react";

function View() {
    const [searchTerm, setSearchTerm] = useState('');
    const destinations = [
        { id: 1, name: 'Paris', rating: 4.8, image: 'https://via.placeholder.com/300x200', price: '12000' },
        { id: 2, name: 'Maldives', rating: 4.9, image: 'https://via.placeholder.com/300x200', price: '20000' },
        { id: 3, name: 'Tokyo', rating: 4.7, image: 'https://via.placeholder.com/300x200', price: '15000' },
    ];

    const filteredDestinations = destinations.filter(dest =>
        dest.name.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (

       <div className="container mt-4">
           {/* Search Bar */}
           <div className="container my-4">
                <form className="d-flex align-items-center mx-auto" style={{ maxWidth: '600px' }}>
                    <input
                        className="form-control rounded-pill px-4 py-2"
                        type="search"
                        placeholder="Search destinations"
                        aria-label="Search"
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                        style={{ width: '100%', boxShadow: '0 2px 6px rgba(0, 0, 0, 0.2)' }}
                    />
                </form>
            </div>
        <h2 className="text-center mb-4">Popular Destinations</h2>
        <div className="row">
            {filteredDestinations.length > 0 ? (
                filteredDestinations.map(dest => (
                    <div key={dest.id} className="col-md-4">
                        <div className="card mb-4 shadow-sm">
                            <img src={dest.image} className="card-img-top" alt={dest.name} />
                            <div className="card-body">
                                <h5 className="card-title">{dest.name}</h5>
                                <p className="card-text">Rating: <strong>{dest.rating} ⭐</strong></p>
                                <p className="card-text">Price: <strong>{dest.price}</strong></p>
                                <button className="btn btn-primary w-100">Book Now</button>
                            </div>
                        </div>
                    </div>
                ))
            ) : (
                <p className="text-center">No destinations found for "{searchTerm}"</p>
            )}
        </div>
        </div>
        
);
}
export default View;

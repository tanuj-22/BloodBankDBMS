import React, { useEffect, useState } from 'react'

const Dashboard = () => {
    const[role,setRole] = useState(<></>);


    useEffect(() => {
        let checkrole = localStorage.getItem("role");
        if(checkrole==="admin"){
            setRole(<>Admin</>)
        }
        else if(checkrole==="donor"){
            setRole(<>Donor</>)
        }
        else if(checkrole==='patient'){
            setRole(<>patient</>)
        }
    }, []);


    return (
        <div>
            This is Dashboard
            <p>{role}</p>
        </div>
    )
}

export default Dashboard

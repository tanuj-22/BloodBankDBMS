import React, { useEffect, useState } from "react";
import Preloader from "./PreLoader";
import GetUserInfo from "./GetUserInfo";

const Dashboard = () => {
  const { getInfo, baseURL } = GetUserInfo();
  const [role, setRole] = useState(<></>);

  useEffect(() => {
    if (getInfo !== undefined) {
      if (getInfo.role === "admin") {
        setRole(<>Admin</>);
      } else if (getInfo.role === "donor") {
        setRole(<>Donor</>);
      } else if (getInfo.role === "patient") {
        setRole(<>patient</>);
      }
    }
  }, [getInfo]);

  return <>{!getInfo ? <Preloader /> : <div>{role}</div>}</>;
};

export default Dashboard;

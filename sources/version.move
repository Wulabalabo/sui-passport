module sui_passport::version;

use sui_passport::stamp::SuperAdminCap;

// ====== Constants =======
const VERSION: u64 = 2;

public struct Version has key {
    id: UID,
    version: u64,
}

fun init(ctx: &mut TxContext) {
    let version = Version {
        id: object::new(ctx),
        version: VERSION,
    };
    transfer::share_object(version);
}

public fun check_version(version: &Version) {
    assert!(version.version == VERSION);
}

public fun update_version(_admin: &SuperAdminCap, version: &mut Version) {
    assert!(version.version < VERSION);
    version.version = VERSION;
}
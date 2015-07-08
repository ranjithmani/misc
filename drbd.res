resource disk1
{
protocol C;

 startup {
        wfc-timeout 30;
        outdated-wfc-timeout 20;
        degr-wfc-timeout 30;
        }
net {
    cram-hmac-alg sha1;
    shared-secret sync-disk;
    }
syncer {
        rate 100M;
        verify-alg sha1;
       }
on drbd1.internal.local {
        device /dev/drbd0;
        disk /dev/VolGroup00/drbdlv;
        address 192.168.1.4:7789;
        meta-disk internal;
        }
on drbd2.internal.local {
        device /dev/drbd0;
        disk /dev/VolGroup00/drbdlv;
        address 192.168.1.5:7789;
        meta-disk internal;
        }
}

SELECT *
FROM sys.fn_get_audit_file(
    'https://odgtest.blob.core.windows.net/sqldbauditlogs/odg-test/ODG-DB/SqlDbAuditing_Audit_NoRetention/2025-01-09/15_45_28_823_0.xel',
    DEFAULT,
    DEFAULT
);
GO

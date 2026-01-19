-- The frames are always read/written as a unit (one entry per HTTP request),
-- so the relational structure was unused. The column stores either:
--   NULL  -> never checked / never extracted
--   '[]'  -> checked, not an animated image (or extraction failed)
--   [{filename, delay_ms}, ...] -> extracted frames, in order
ALTER TABLE images ADD COLUMN IF NOT EXISTS animated_frames jsonb;

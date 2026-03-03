Return-Path: <linux-kbuild+bounces-11541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOEfEWpSp2lsgwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11541-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 22:28:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A31041F7844
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 22:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6B5F302A6D7
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 21:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185C438654B;
	Tue,  3 Mar 2026 21:25:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAE833DEFC
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Mar 2026 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573135; cv=none; b=i5I6TQGuAQUb3mKAdRdXmBFp2B5oPxZmEpSzw32BRQWwVm2+qdM17GQX1MQ/bsqu8X6mRSZJ0lzGqiBKVTOFNIar8+TlqahAfD2+fODxcPL3111Y/GyCJnY+HdpPYHXyx9lTEpERvUIwIbsiCCHReivHoV8ez43mHqeN3KySUzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573135; c=relaxed/simple;
	bh=GKC/6aY/fX4AuHN5nvpVSyIlMI8YejQxjzNrIxlG8cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qotkv8rXXP8sfSJurIxaBAsHb//FUYqYunbYRk5940oHJMnu3KZjVQM25AlB6GVbsSnHKSqZXoF80f0/ePq8ZTTfaj0QRih021cTel6Yi8Ab9iPcgI3LX+TC7tecrwNa6YhOnrt/idBTKKjBhzDqL1oJMRFJtUy9vwEjUEO+vVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ff14dd9bf8so1643817137.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2026 13:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772573132; x=1773177932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmPwQkA8aJZjLJygLiKXdhC/x1FwVUYVZ/mvrrcqizQ=;
        b=VDg0eSk7IzqUOAFL541EgPcLqZqtbLkxTNr1qJPMdBDcBok7/Bg/mUoyTlYKf+0s6R
         Dk6VWx+/bTCFCh67lRIJL3+J8iNceuUbPhYzYu5kaWPYLXYySazsklrGCl7QfW6q2MHV
         fOAVRjhHXh2kJuMC6ySO7TPYtzdzCdwxpj9cYVKBKaiKO9yrvnI5yKDs9Hf3bFQvviF3
         mONtHK7B5QKjfM6kd32yL4mjcfZLUKXkhKP9gMMCZZ3solkIKSVipXNj5qELEPhr+m39
         KVYFXb4IAQyTpn28JWKVKKjVzprCsfDcrJ5+gVe0sKlh8S5ZEXk3AuGNZUnKCKbwuAVd
         8/eg==
X-Forwarded-Encrypted: i=1; AJvYcCWn5qRNZHDO96hdkgK+1y+iRiclTrn4gRHh8ItiPH+frZLme8jV88y0LtxGRMfd/SPnTpmUPFVMyP7LhIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtMPaG0V6mKV6/9asQfX7PG4rErokab5F8UikhxzBfRhqBY3lx
	Fpfj1fyK9Yq1SEvXmG/l1wS81YH3JS5ZU8RXQAM0YkgdLcKTYxzNDtMouZpQCCVO
X-Gm-Gg: ATEYQzwJekCbRU7buN5sbTNjHoZKb+9RsZnERHyI8aOIl2MDnPSkRQAY68rXb0SsHC0
	iN0hPTi4cnvHg6vkg4CN5cM5B/ow66dpmMXIoabZMi7wMW+z9avfKC6i/k/ZutqwxFmRgoYAojR
	Nl2QQdBUDu0WI/COU35TBhrNESatfVdpOjebGq9gX8gMcEPYqYd1vLRc9SyHpn0nv/6PQV+rgn5
	TFVpbGrTHW5FzZKyTN+mYgdovrF3BNHhasAMkEtuGeoTRzvFI6+UrGg0cwCHr/jbJ/F71DF3lpy
	nlzHmhyY37sCqlwgteHiFoJzGPlwqa6aja4bQq0JDdS5/jzjiFgqQxpifDD8HJxM62USrz/hLDZ
	g9bk8X3ak1Bg49Jp6hXHR53qAe9CANriqG5dDZdIeAsYx117MSofSMaTdqk/ZcVW1WIXtfHEuah
	89pGCa2rWtnhwX896B7W92esanbRb31YmqKIGJRxLmFoYCPoI7GGMlH/ulB5UN
X-Received: by 2002:a05:6102:3587:b0:5f8:f6f3:84d7 with SMTP id ada2fe7eead31-5ff3234befcmr5364149137.13.1772573131862;
        Tue, 03 Mar 2026 13:25:31 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea15925sm19225839137.8.2026.03.03.13.25.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 13:25:30 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so1408099241.1
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2026 13:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbA5R5T+z7WkyOxGtkshEz/bzItrffHLAvvAa8RdkbMUeWCZMPsn3ho7+wLhXLU6XuYJqXLjf0E3ILn3o=@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:5ed:f13:e58a with SMTP id
 ada2fe7eead31-5ff325ad1bbmr6476605137.37.1772573130116; Tue, 03 Mar 2026
 13:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303182103.3523438-1-sashal@kernel.org> <20260303182103.3523438-4-sashal@kernel.org>
In-Reply-To: <20260303182103.3523438-4-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 22:25:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUv61E0wnQOaZ+M+pXrzZNYzsQLQV_05uTpz7YXyu25VQ@mail.gmail.com>
X-Gm-Features: AaiRm50MU22nmE-L93SR-97Qa2M72gOliUTByfCL_hDHorQGfLK5J9LZ0BvCKqM
Message-ID: <CAMuHMdUv61E0wnQOaZ+M+pXrzZNYzsQLQV_05uTpz7YXyu25VQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x
 size reduction
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A31041F7844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11541-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Sasha,

On Tue, 3 Mar 2026 at 19:22, Sasha Levin <sashal@kernel.org> wrote:
> Replace the flat uncompressed parallel arrays (lineinfo_addrs[],
> lineinfo_file_ids[], lineinfo_lines[]) with a block-indexed,
> delta-encoded, ULEB128 varint compressed format.
>
> The sorted address array has small deltas between consecutive entries
> (typically 1-50 bytes), file IDs have high locality (delta often 0,
> same file), and line numbers change slowly.  Delta-encoding followed
> by ULEB128 varint compression shrinks most values from 4 bytes to 1.
>
> Entries are grouped into blocks of 64.  A small uncompressed block
> index (first addr + byte offset per block) enables O(log(N/64)) binary
> search, followed by sequential decode of at most 64 varints within the
> matching block.  All decode state lives on the stack -- zero
> allocations, still safe for NMI/panic context.
>
> Measured on a defconfig+debug x86_64 build (3,017,154 entries, 4,822
> source files, 47,144 blocks):
>
>   Before (flat arrays):
>     lineinfo_addrs[]    12,068,616 bytes (u32 x 3.0M)
>     lineinfo_file_ids[]  6,034,308 bytes (u16 x 3.0M)
>     lineinfo_lines[]    12,068,616 bytes (u32 x 3.0M)
>     Total:              30,171,540 bytes (28.8 MiB, 10.0 bytes/entry)
>
>   After (block-indexed delta + ULEB128):
>     lineinfo_block_addrs[]    188,576 bytes (184 KiB)
>     lineinfo_block_offsets[]  188,576 bytes (184 KiB)
>     lineinfo_data[]        10,926,128 bytes (10.4 MiB)
>     Total:                 11,303,280 bytes (10.8 MiB, 3.7 bytes/entry)
>
>   Savings: 18.0 MiB (2.7x reduction)
>
> Booted in QEMU and verified with SysRq-l that annotations still work:
>
>   default_idle+0x9/0x10 (arch/x86/kernel/process.c:767)
>   default_idle_call+0x6c/0xb0 (kernel/sched/idle.c:122)
>   do_idle+0x335/0x490 (kernel/sched/idle.c:191)
>   cpu_startup_entry+0x4e/0x60 (kernel/sched/idle.c:429)
>   rest_init+0x1aa/0x1b0 (init/main.c:760)
>
> Suggested-by: Juergen Gross <jgross@suse.com>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks for your patch!

> --- a/include/linux/mod_lineinfo.h
> +++ b/include/linux/mod_lineinfo.h

> +/*
> + * Read a ULEB128 varint from a byte stream.
> + * Returns the decoded value and advances *pos past the encoded bytes.
> + * If *pos would exceed 'end', returns 0 and sets *pos = end (safe for
> + * NMI/panic context -- no crash, just a missed annotation).
> + */
> +static inline u32 lineinfo_read_uleb128(const u8 *data, u32 *pos, u32 end)
> +{
> +       u32 result = 0;
> +       unsigned int shift = 0;
> +
> +       while (*pos < end) {
> +               u8 byte = data[*pos];
> +               (*pos)++;
> +               result |= (u32)(byte & 0x7f) << shift;
> +               if (!(byte & 0x80))
> +                       return result;
> +               shift += 7;
> +               if (shift >= 32) {
> +                       /* Malformed -- skip remaining continuation bytes */
> +                       while (*pos < end && (data[*pos] & 0x80))
> +                               (*pos)++;
> +                       if (*pos < end)
> +                               (*pos)++;
> +                       return result;
> +               }
> +       }
> +       return result;
> +}

FTR, arch/arc/kernel/unwind.c, arch/sh/kernel/dwarf.c, and
tools/perf/util/genelf_debug.calready have (different) LEB128 accessors,
so there is an opportunity for consolidation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-kbuild+bounces-12073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBuUGozSu2k4owIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12073-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 11:40:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B037B2C999A
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 11:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 176C331AB1A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 10:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E8C352927;
	Thu, 19 Mar 2026 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ED7fmuou"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0917A3C13E4
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916644; cv=none; b=boG5fMhti1QrI0NTD3nAxLkEHHGZubggg4OdDonP1dvYL+ePhETgvtjx8NbuIZlTRZ1CeYm87e701GXRZn/NjMua+E5lbdItrf7DuG6Zb280Au+afouvskRbZXwAMHI3w7yESExL6bQCraGTn+6ztJuPbxLjC2vAJfoiUgfrwaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916644; c=relaxed/simple;
	bh=4SDphnD5hDgAf2UsgDlJm4KJCfXx+GN2lXkOiul5KIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAenIEHmLC+yecubMGwhyy73X1UFuOf9NIWiY60CxCanpwYPwsql23OANIJBZ64j+wFJBOBKDqvx+pyIFAFEWenJjmJMtBpH6GXPjkkK6jr/gz4K94rC79B+E3mO7GtvBBwsWtlj/ouysmacw/3o8muw0Jp1+Qmi67irGgEVaJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ED7fmuou; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so763790f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773916640; x=1774521440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TO1y6konA69/rJruQkSbZ9hkhpErgowRDYBjEEx+eEw=;
        b=ED7fmuouLxnzKiXJYEaqwRUVpxw4N5ssGFIIrhcj4wSHDy3iNW9WRqsSSv8r2lDRl5
         MaMvqljEJVYVMKFR/TWbAHTthb61iuRZ3UlB/VqNIZ9e53Fbm2AunIJRQ61UlftyGEQH
         cN76oPQpMMDHdxFbjgs9g51qLiLKp/ivr5xwsVq004Ct0lglpb7uRnKUTt99MVoRDKgg
         4vqhOSNppo3vr4j9QSinYHkrCPkJudgw5oLFQw0ct5cToTzxcOqS0LbfEsIvTjLDAmu/
         bP4whCzJk2b+gjlUwZba/K5YyaILgDX2/4++XV1WQryUYpYqCDdLt7CoHviqFNM7p9oP
         Xfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916640; x=1774521440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TO1y6konA69/rJruQkSbZ9hkhpErgowRDYBjEEx+eEw=;
        b=r54FP5XQpd8uA0ehbRy3rMXFHDL6C+PMgbEKcJQWIsz3kq5T1CnOkT2gbAhFAptFQ1
         OPlzCisku6hwgMfqz+IHVc5hOt8Y5JJXYkDvbqpVmnPVkgb8trV4nH2Z/6KGFqcv/28O
         h9PenadDBGhEA+hG5Bjg+Q4TjzFSbi/SfIn/4/ZA3F8WZD1ikqYQZmPX0jg+dfyju38Q
         FBmAuxcHS4+G90ypjLMUDc33sJZ1bKDTjd4/Gtz+wjRw0W6K1usNm6a2AWEBZ6melRiN
         rGaKvdgncMY7pIO8Gpn3EStBBVQq343EB75dA28bTcbMKbUZs6zWL3aWZfW/OeXCauck
         zF1w==
X-Forwarded-Encrypted: i=1; AJvYcCWPMd/9yh3HdGKONZ1SkiChGlSZr7jXncQDi/a70mFhOMRx5vPCeAEKupDsDRyAPUAxAR8BUtW/9t02t5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3yEvkWSV5Jf9FiMflNQsO5s94GHCdobmi/It8X4tb6bMTA/x
	JW1qDWS6tLtq2oGT1NMbJLZZdwhIHAqLdm+oBOL3nGJ1X+cP9gyeJo9o7LX7fVTzDDQ=
X-Gm-Gg: ATEYQzzOJL8dZtTghWDIGrJOWSl0ZUBS4j/u8qhnIGsovInEFynD26Sg7mnbnKLHh8q
	r3+dD/AuaA+pJ+4SNmBOpH53UxHSr4l2IRJ65yXRAgmK/svIOoIJd+BDowWOS33xXEDFb+NG0sQ
	9c+NvvPKyLG9ANQRGcIP9huw6NTFiSckCHZN1r2z84838etKI5VwUfMS325qmU4i0cVOLTlLb37
	Ix7NyVQL98j3Z8RUZk+nGwRtCxGf9ZWMwKhnnqM7Jmb1HCWYryVqe5gSvLd1MwZtjC0peylNbeN
	1mSIwAQ3cfZS2b0jQtnFCwsrPkxz9ca56yshLhNlGGD1YEMPvNj9QSshIN5fr0+F2K8XqtslmoO
	jqtcA8VxgrSaoqA+1Vy76R+MDEjwYmiKwWlCiLNnIE/yZdlE2oEywh8IYKI4b89cRNFZMKX4XOr
	EERCuQ2Ou2BiCGa2CdkSSVTdE37Ygfp/bXwGa9zl393hOH
X-Received: by 2002:a05:6000:144a:b0:43b:4625:5933 with SMTP id ffacd0b85a97d-43b527c42bfmr11631227f8f.30.1773916639878;
        Thu, 19 Mar 2026 03:37:19 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm15527266f8f.1.2026.03.19.03.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:37:19 -0700 (PDT)
Message-ID: <79244e56-b3ea-4986-b4a2-91a78b21bf07@suse.com>
Date: Thu, 19 Mar 2026 11:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] kallsyms: extend lineinfo to loadable modules
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil Babka
 <vbabka@kernel.org>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260312030649.674699-1-sashal@kernel.org>
 <20260312030649.674699-3-sashal@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260312030649.674699-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,nod.at,suse.com,linux-m68k.org,HansenPartnership.com,lwn.net,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12073-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,gen-btf.sh:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gen-mod-lineinfo.sh:url,sourceware.org:url]
X-Rspamd-Queue-Id: B037B2C999A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 4:06 AM, Sasha Levin wrote:
> Add CONFIG_KALLSYMS_LINEINFO_MODULES, which extends the
> CONFIG_KALLSYMS_LINEINFO feature to loadable kernel modules.
> 
> At build time, each .ko is post-processed by scripts/gen-mod-lineinfo.sh
> (modeled on gen-btf.sh) which runs scripts/gen_lineinfo --module on the
> .ko, generates a .mod_lineinfo section containing a compact binary table
> of .text-relative offsets, file IDs, line numbers, and filenames, and
> embeds it back into the .ko via objcopy.
> 
> At runtime, module_lookup_lineinfo() performs a binary search on the
> module's .mod_lineinfo section, and __sprint_symbol() calls it for
> addresses that fall within a module.  The lookup is NMI/panic-safe
> (no locks, no allocations) — the data lives in read-only module memory
> and is freed automatically when the module is unloaded.
> 
> The gen_lineinfo tool gains --module mode which:
>  - Uses .text section address as base (ET_REL files have no _text symbol)
>  - Filters entries to .text-only (excludes .init.text/.exit.text)
>  - Handles libdw's ET_REL path-doubling quirk in make_relative()
>  - Outputs a flat binary-format section instead of named global symbols
> 
> Per-module overhead is approximately 10 bytes per DWARF line entry.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  .../admin-guide/kallsyms-lineinfo.rst         |  40 +-
>  MAINTAINERS                                   |   2 +
>  include/linux/mod_lineinfo.h                  |  68 ++++
>  include/linux/module.h                        |   5 +
>  init/Kconfig                                  |  13 +
>  kernel/kallsyms.c                             |  18 +-
>  kernel/module/kallsyms.c                      |  91 +++++
>  kernel/module/main.c                          |   3 +
>  scripts/Makefile                              |   1 +
>  scripts/Makefile.modfinal                     |   6 +
>  scripts/gen-mod-lineinfo.sh                   |  48 +++
>  scripts/gen_lineinfo.c                        | 349 ++++++++++++++++--
>  12 files changed, 604 insertions(+), 40 deletions(-)
>  create mode 100644 include/linux/mod_lineinfo.h
>  create mode 100755 scripts/gen-mod-lineinfo.sh
> 
> diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
> index c8ec124394354..5cae995eb118e 100644
> --- a/Documentation/admin-guide/kallsyms-lineinfo.rst
> +++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
> @@ -51,22 +51,46 @@ With ``CONFIG_KALLSYMS_LINEINFO``::
>  Note that assembly routines (such as ``entry_SYSCALL_64_after_hwframe``) are
>  not annotated because they lack DWARF debug information.
>  
> +Module Support
> +==============
> +
> +``CONFIG_KALLSYMS_LINEINFO_MODULES`` extends the feature to loadable kernel
> +modules.  When enabled, each ``.ko`` is post-processed at build time to embed
> +a ``.mod_lineinfo`` section containing the same kind of address-to-source
> +mapping.
> +
> +Enable in addition to the base options::
> +
> +    CONFIG_MODULES=y
> +    CONFIG_KALLSYMS_LINEINFO_MODULES=y
> +
> +Stack traces from module code will then include annotations::
> +
> +    my_driver_func+0x30/0x100 [my_driver] (drivers/foo/bar.c:123)
> +
> +The ``.mod_lineinfo`` section is loaded into read-only module memory alongside
> +the module text.  No additional runtime memory allocation is required; the data
> +is freed when the module is unloaded.
> +
>  Memory Overhead
>  ===============
>  
> -The lineinfo tables are stored in ``.rodata`` and typically add approximately
> -44 MiB to the kernel image for a standard configuration (~4.6 million DWARF
> -line entries, ~10 bytes per entry after deduplication).
> +The vmlinux lineinfo tables are stored in ``.rodata`` and typically add
> +approximately 44 MiB to the kernel image for a standard configuration
> +(~4.6 million DWARF line entries, ~10 bytes per entry after deduplication).
> +
> +Per-module lineinfo adds approximately 10 bytes per DWARF line entry to each
> +``.ko`` file.
>  
>  Known Limitations
>  =================
>  
> -- **vmlinux only**: Only symbols in the core kernel image are annotated.
> -  Module symbols are not covered.
> -- **4 GiB offset limit**: Address offsets from ``_text`` are stored as 32-bit
> -  values.  Entries beyond 4 GiB from ``_text`` are skipped at build time with
> -  a warning.
> +- **4 GiB offset limit**: Address offsets from ``_text`` (vmlinux) or
> +  ``.text`` base (modules) are stored as 32-bit values.  Entries beyond
> +  4 GiB are skipped at build time with a warning.
>  - **65535 file limit**: Source file IDs are stored as 16-bit values.  Builds
>    with more than 65535 unique source files will fail with an error.
>  - **No assembly annotations**: Functions implemented in assembly that lack
>    DWARF ``.debug_line`` data are not annotated.
> +- **No init text**: For modules, functions in ``.init.text`` are not annotated
> +  because that memory is freed after module initialization.

A second table .init.mod_lineinfo could be added to provide the
necessary information for .init sections, which would be dropped along
with all the other init code+data.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f061e69b6e32a..535e992ca5a20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13732,6 +13732,8 @@ KALLSYMS LINEINFO
>  M:	Sasha Levin <sashal@kernel.org>
>  S:	Maintained
>  F:	Documentation/admin-guide/kallsyms-lineinfo.rst
> +F:	include/linux/mod_lineinfo.h
> +F:	scripts/gen-mod-lineinfo.sh
>  F:	scripts/gen_lineinfo.c
>  
>  KASAN
> diff --git a/include/linux/mod_lineinfo.h b/include/linux/mod_lineinfo.h
> new file mode 100644
> index 0000000000000..d62e9608f0f82
> --- /dev/null
> +++ b/include/linux/mod_lineinfo.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mod_lineinfo.h - Binary format for per-module source line information
> + *
> + * This header defines the layout of the .mod_lineinfo section embedded
> + * in loadable kernel modules.  It is dual-use: included from both the
> + * kernel and the userspace gen_lineinfo tool.
> + *
> + * Section layout (all values in target-native endianness):
> + *
> + *   struct mod_lineinfo_header     (16 bytes)
> + *   u32 addrs[num_entries]         -- offsets from .text base, sorted

Modules are relocatable objects. The typical way to express a reference
from one section to data in another section is to use relocations.
Choosing to use an implicit base and resolved offsets means that the
code has trouble correctly referencing the .text section and can't
express line information data for other sections, such as .exit.text.

> + *   u16 file_ids[num_entries]      -- parallel to addrs
> + *   <2-byte pad if num_entries is odd>
> + *   u32 lines[num_entries]         -- parallel to addrs
> + *   u32 file_offsets[num_files]    -- byte offset into filenames[]
> + *   char filenames[filenames_size] -- concatenated NUL-terminated strings

Nit: The description could be a bit easier to navigate if the
mod_lineinfo_header struct was expanded, so it is clear where
num_entries, num_files and filenames_size come from.

> + */
> +#ifndef _LINUX_MOD_LINEINFO_H
> +#define _LINUX_MOD_LINEINFO_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#else
> +#include <stdint.h>
> +typedef uint32_t u32;
> +typedef uint16_t u16;
> +#endif
> +
> +struct mod_lineinfo_header {
> +	u32 num_entries;
> +	u32 num_files;
> +	u32 filenames_size;	/* total bytes of concatenated filenames */

An alternative would be to say that the filenames data extends to the
end of the section, without requiring an explicit filenames_size.

> +	u32 reserved;		/* padding, must be 0 */

I believe the format should remain internal to the kernel, so there is
no need for such a reserved member.

> +};
> +
> +/* Offset helpers: compute byte offset from start of section to each array */
> +
> +static inline u32 mod_lineinfo_addrs_off(void)
> +{
> +	return sizeof(struct mod_lineinfo_header);
> +}
> +
> +static inline u32 mod_lineinfo_file_ids_off(u32 num_entries)
> +{
> +	return mod_lineinfo_addrs_off() + num_entries * sizeof(u32);
> +}
> +
> +static inline u32 mod_lineinfo_lines_off(u32 num_entries)
> +{
> +	/* u16 file_ids[] may need 2-byte padding to align lines[] to 4 bytes */
> +	u32 off = mod_lineinfo_file_ids_off(num_entries) +
> +		  num_entries * sizeof(u16);
> +	return (off + 3) & ~3u;
> +}
> +
> +static inline u32 mod_lineinfo_file_offsets_off(u32 num_entries)
> +{
> +	return mod_lineinfo_lines_off(num_entries) + num_entries * sizeof(u32);
> +}
> +
> +static inline u32 mod_lineinfo_filenames_off(u32 num_entries, u32 num_files)
> +{
> +	return mod_lineinfo_file_offsets_off(num_entries) +
> +	       num_files * sizeof(u32);
> +}

These helpers are used only from kernel/module/kallsyms.c. I assume they
are present in this header file to stay close to the description of the
format.

I personally find them quite verbose. The module_lookup_lineinfo()
function needs an intimate knowledge of the data format anyway. The code
in module_lookup_lineinfo() could be replaced with just:

	addrs = base + sizeof(struct mod_lineinfo_header);
	file_ids = addrs + num_entries * sizeof(u32);
	lines = (file_ids + num_entries * sizeof(u16) + 3) & ~3u;
	file_offsets = lines + num_entries * sizeof(u32);
	filenames = file_offsets + num_files * sizeof(u32);

> +
> +#endif /* _LINUX_MOD_LINEINFO_H */
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 14f391b186c6d..d23e0cd9c7210 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -508,6 +508,8 @@ struct module {
>  	void *btf_data;
>  	void *btf_base_data;
>  #endif
> +	void *lineinfo_data;		/* .mod_lineinfo section in MOD_RODATA */
> +	unsigned int lineinfo_data_size;

The lineinfo-specific members should be enclosed within the `#ifdef
CONFIG_KALLSYMS_LINEINFO_MODULES`.

This will require module_lookup_lineinfo() to be conditionally compiled
based on CONFIG_KALLSYMS_LINEINFO_MODULES, with a dummy version provided
otherwise. Alternatively, accessors to module::lineinfo_data and
module::lineinfo_data_size that handle CONFIG_KALLSYMS_LINEINFO_MODULES
could be introduced in include/linux/module.h. For example, see
module_buildid() or is_livepatch_module.

>  #ifdef CONFIG_JUMP_LABEL
>  	struct jump_entry *jump_entries;
>  	unsigned int num_jump_entries;
> @@ -1021,6 +1023,9 @@ static inline unsigned long find_kallsyms_symbol_value(struct module *mod,
>  
>  #endif  /* CONFIG_MODULES && CONFIG_KALLSYMS */
>  
> +bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
> +			    const char **file, unsigned int *line);
> +
>  /* Define __free(module_put) macro for struct module *. */
>  DEFINE_FREE(module_put, struct module *, if (_T) module_put(_T))
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index c39f27e6393a8..bf53275bc405a 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2070,6 +2070,19 @@ config KALLSYMS_LINEINFO
>  
>  	  If unsure, say N.
>  
> +config KALLSYMS_LINEINFO_MODULES
> +	bool "Embed source file:line information in module stack traces"
> +	depends on KALLSYMS_LINEINFO && MODULES
> +	help
> +	  Extends KALLSYMS_LINEINFO to loadable kernel modules.  Each .ko
> +	  gets a lineinfo table generated from its DWARF data at build time,
> +	  so stack traces from module code include (file.c:123) annotations.
> +
> +	  Requires elfutils (libdw-dev/elfutils-devel) on the build host.
> +	  Increases .ko sizes by approximately 10 bytes per DWARF line entry.
> +
> +	  If unsure, say N.
> +
>  # end of the "standard kernel features (expert users)" menu
>  
>  config ARCH_HAS_MEMBARRIER_CALLBACKS
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index d0a9cd9c6dace..9df92b0fd9041 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -543,12 +543,24 @@ static int __sprint_symbol(char *buffer, unsigned long address,
>  		len += sprintf(buffer + len, "]");
>  	}
>  
> -	if (IS_ENABLED(CONFIG_KALLSYMS_LINEINFO) && !modname) {
> +	if (IS_ENABLED(CONFIG_KALLSYMS_LINEINFO)) {
>  		const char *li_file;
>  		unsigned int li_line;
> +		bool found = false;
> +
> +		if (!modname)
> +			found = kallsyms_lookup_lineinfo(address,
> +							 &li_file, &li_line);
> +		else if (IS_ENABLED(CONFIG_KALLSYMS_LINEINFO_MODULES)) {
> +			struct module *mod = __module_address(address);
> +
> +			if (mod)
> +				found = module_lookup_lineinfo(mod, address,
> +							      &li_file,
> +							      &li_line);
> +		}
>  
> -		if (kallsyms_lookup_lineinfo(address,
> -					     &li_file, &li_line))
> +		if (found)
>  			len += snprintf(buffer + len, KSYM_SYMBOL_LEN - len,
>  					" (%s:%u)", li_file, li_line);
>  	}
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index 0fc11e45df9b9..5b46293e957ab 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -494,3 +494,94 @@ int module_kallsyms_on_each_symbol(const char *modname,
>  	mutex_unlock(&module_mutex);
>  	return ret;
>  }
> +
> +#include <linux/mod_lineinfo.h>
> +
> +/*
> + * Look up source file:line for an address within a loaded module.
> + * Uses the .mod_lineinfo section embedded in the .ko at build time.
> + *
> + * Safe in NMI/panic context: no locks, no allocations.
> + * Caller must hold RCU read lock (or be in a context where the module
> + * cannot be unloaded).
> + */
> +bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
> +			    const char **file, unsigned int *line)
> +{
> +	const struct mod_lineinfo_header *hdr;
> +	const void *base;
> +	const u32 *addrs, *lines, *file_offsets;
> +	const u16 *file_ids;
> +	const char *filenames;
> +	u32 num_entries, num_files, filenames_size;
> +	unsigned long text_base;
> +	unsigned int offset;
> +	unsigned long long raw_offset;
> +	unsigned int low, high, mid;
> +	u16 file_id;
> +
> +	if (!IS_ENABLED(CONFIG_KALLSYMS_LINEINFO_MODULES))
> +		return false;
> +
> +	base = mod->lineinfo_data;
> +	if (!base)
> +		return false;
> +
> +	if (mod->lineinfo_data_size < sizeof(*hdr))
> +		return false;
> +
> +	hdr = base;
> +	num_entries = hdr->num_entries;
> +	num_files = hdr->num_files;
> +	filenames_size = hdr->filenames_size;
> +
> +	if (num_entries == 0)
> +		return false;
> +
> +	/* Validate section is large enough for all arrays */
> +	if (mod->lineinfo_data_size <
> +	    mod_lineinfo_filenames_off(num_entries, num_files) + filenames_size)
> +		return false;
> +
> +	addrs = base + mod_lineinfo_addrs_off();
> +	file_ids = base + mod_lineinfo_file_ids_off(num_entries);
> +	lines = base + mod_lineinfo_lines_off(num_entries);
> +	file_offsets = base + mod_lineinfo_file_offsets_off(num_entries);
> +	filenames = base + mod_lineinfo_filenames_off(num_entries, num_files);
> +
> +	/* Compute offset from module .text base */
> +	text_base = (unsigned long)mod->mem[MOD_TEXT].base;

The module::mem[] covers module memory regions. One can think of them as
ELF segments, except they are created dynamically by the module loader.
The code conflates the .text section and the TEXT segment. I'm not aware
of any guarantee that the .text section will be always placed as the
first section in this segment.

Relocations can be used to accurately reference the .text section.

> +	if (addr < text_base)
> +		return false;
> +
> +	raw_offset = addr - text_base;
> +	if (raw_offset > UINT_MAX)

The offsets in the addrs array are of the u32 type, so this should be
strictly speaking checked against U32_MAX.

> +		return false;
> +	offset = (unsigned int)raw_offset;
> +
> +	/* Binary search for largest entry <= offset */
> +	low = 0;
> +	high = num_entries;
> +	while (low < high) {
> +		mid = low + (high - low) / 2;
> +		if (addrs[mid] <= offset)
> +			low = mid + 1;
> +		else
> +			high = mid;
> +	}
> +
> +	if (low == 0)
> +		return false;
> +	low--;
> +
> +	file_id = file_ids[low];
> +	if (file_id >= num_files)
> +		return false;
> +
> +	if (file_offsets[file_id] >= filenames_size)
> +		return false;
> +
> +	*file = &filenames[file_offsets[file_id]];
> +	*line = lines[low];
> +	return true;
> +}
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 2bac4c7cd019a..d11646b02730a 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2648,6 +2648,9 @@ static int find_module_sections(struct module *mod, struct load_info *info)
>  	mod->btf_base_data = any_section_objs(info, ".BTF.base", 1,
>  					      &mod->btf_base_data_size);
>  #endif
> +	if (IS_ENABLED(CONFIG_KALLSYMS_LINEINFO_MODULES))
> +		mod->lineinfo_data = any_section_objs(info, ".mod_lineinfo", 1,
> +						      &mod->lineinfo_data_size);
>  #ifdef CONFIG_JUMP_LABEL
>  	mod->jump_entries = section_objs(info, "__jump_table",
>  					sizeof(*mod->jump_entries),
> diff --git a/scripts/Makefile b/scripts/Makefile
> index ffe89875b3295..651df2a867ffb 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -5,6 +5,7 @@
>  
>  hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
>  hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO)		+= gen_lineinfo
> +hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO_MODULES)	+= gen_lineinfo

This line is unnecessary because CONFIG_KALLSYMS_LINEINFO_MODULES
depends on CONFIG_KALLSYMS_LINEINFO.

>  hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
>  hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
>  hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index adcbcde16a071..3941cf624526b 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -46,6 +46,9 @@ quiet_cmd_btf_ko = BTF [M] $@
>  		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
>  	fi;
>  
> +quiet_cmd_lineinfo_ko = LINEINFO [M] $@
> +      cmd_lineinfo_ko = $(CONFIG_SHELL) $(srctree)/scripts/gen-mod-lineinfo.sh $@
> +
>  # Same as newer-prereqs, but allows to exclude specified extra dependencies
>  newer_prereqs_except = $(filter-out $(PHONY) $(1),$?)
>  
> @@ -59,6 +62,9 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>  	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
> +endif
> +ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
> +	+$(if $(newer-prereqs),$(call cmd,lineinfo_ko))

Should this be 'if_changed_except.. vmlinux'?

>  endif
>  	+$(call cmd,check_tracepoint)
>  
> diff --git a/scripts/gen-mod-lineinfo.sh b/scripts/gen-mod-lineinfo.sh
> new file mode 100755
> index 0000000000000..d0663b862d31b
> --- /dev/null
> +++ b/scripts/gen-mod-lineinfo.sh
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# gen-mod-lineinfo.sh - Embed source line info into a kernel module (.ko)
> +#
> +# Reads DWARF from the .ko, generates a .mod_lineinfo section, and
> +# embeds it back into the .ko.  Modeled on scripts/gen-btf.sh.
> +
> +set -e
> +
> +if [ $# -ne 1 ]; then
> +	echo "Usage: $0 <module.ko>" >&2
> +	exit 1
> +fi
> +
> +KO="$1"
> +
> +cleanup() {
> +	rm -f "${KO}.lineinfo.S" "${KO}.lineinfo.o" "${KO}.lineinfo.bin"
> +}
> +trap cleanup EXIT
> +
> +case "${KBUILD_VERBOSE}" in
> +*1*)
> +	set -x
> +	;;
> +esac
> +
> +# Generate assembly from DWARF -- if it fails (no DWARF), silently skip
> +if ! ${objtree}/scripts/gen_lineinfo --module "${KO}" > "${KO}.lineinfo.S"; then
> +	exit 0
> +fi
> +
> +# Compile assembly to object file
> +${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> +	${KBUILD_AFLAGS} ${KBUILD_AFLAGS_MODULE} \
> +	-c -o "${KO}.lineinfo.o" "${KO}.lineinfo.S"
> +
> +# Extract raw section content
> +${OBJCOPY} -O binary --only-section=.mod_lineinfo \
> +	"${KO}.lineinfo.o" "${KO}.lineinfo.bin"
> +
> +# Embed into the .ko with alloc,readonly flags
> +${OBJCOPY} --add-section ".mod_lineinfo=${KO}.lineinfo.bin" \
> +	--set-section-flags .mod_lineinfo=alloc,readonly \
> +	"${KO}"
> +
> +exit 0
> diff --git a/scripts/gen_lineinfo.c b/scripts/gen_lineinfo.c
> index 37d5e84971be4..5ced6897cbbee 100644
> --- a/scripts/gen_lineinfo.c
> +++ b/scripts/gen_lineinfo.c
> @@ -23,8 +23,16 @@
>  #include <gelf.h>
>  #include <limits.h>
>  
> +#include "../include/linux/mod_lineinfo.h"
> +
> +static int module_mode;
> +
>  static unsigned int skipped_overflow;
>  
> +/* .text range for module mode (keep only runtime code) */
> +static unsigned long long text_section_start;
> +static unsigned long long text_section_end;
> +
>  struct line_entry {
>  	unsigned int offset;	/* offset from _text */
>  	unsigned int file_id;
> @@ -148,27 +156,25 @@ static const char *make_relative(const char *path, const char *comp_dir)
>  {
>  	const char *p;
>  
> -	/* If already relative, use as-is */
> -	if (path[0] != '/')
> -		return path;
> -
> -	/* comp_dir from DWARF is the most reliable method */
> -	if (comp_dir) {
> -		size_t len = strlen(comp_dir);
> -
> -		if (!strncmp(path, comp_dir, len) && path[len] == '/') {
> -			const char *rel = path + len + 1;
> -
> -			/*
> -			 * If comp_dir pointed to a subdirectory
> -			 * (e.g. arch/parisc/kernel) rather than
> -			 * the tree root, stripping it leaves a
> -			 * bare filename.  Fall through to the
> -			 * kernel_dirs scan so we recover the full
> -			 * relative path instead.
> -			 */
> -			if (strchr(rel, '/'))
> -				return rel;
> +	if (path[0] == '/') {
> +		/* Try comp_dir prefix from DWARF */
> +		if (comp_dir) {
> +			size_t len = strlen(comp_dir);
> +
> +			if (!strncmp(path, comp_dir, len) && path[len] == '/') {
> +				const char *rel = path + len + 1;
> +
> +				/*
> +				 * If comp_dir pointed to a subdirectory
> +				 * (e.g. arch/parisc/kernel) rather than
> +				 * the tree root, stripping it leaves a
> +				 * bare filename.  Fall through to the
> +				 * kernel_dirs scan so we recover the full
> +				 * relative path instead.
> +				 */
> +				if (strchr(rel, '/'))
> +					return rel;
> +			}
>  		}
>  
>  		/*
> @@ -194,9 +200,45 @@ static const char *make_relative(const char *path, const char *comp_dir)
>  		return p ? p + 1 : path;
>  	}
>  
> -	/* Fall back to basename */
> -	p = strrchr(path, '/');
> -	return p ? p + 1 : path;
> +	/*
> +	 * Relative path — check for duplicated-path quirk from libdw
> +	 * on ET_REL files (e.g., "a/b.c/a/b.c" → "a/b.c").
> +	 */

When does this quirk occur? Is it a bug in libdw?

> +	{
> +		size_t len = strlen(path);
> +
> +		for (p = path; (p = strchr(p, '/')) != NULL; p++) {
> +			size_t prefix = p - path;
> +			size_t rest = len - prefix - 1;
> +
> +			if (rest == prefix && !memcmp(path, p + 1, prefix))
> +				return p + 1;
> +		}

Isn't this loop same as:

size_t mid = len / 2;
if (path[mid] == '/' && !memcmp(path, path + mid + 1, mid - 1))
	return path + mid + 1;

> +	}
> +
> +	/*
> +	 * Bare filename with no directory component — try to recover the
> +	 * relative path using comp_dir.  Some toolchains/elfutils combos
> +	 * produce bare filenames where comp_dir holds the source directory.
> +	 * Construct the absolute path and run the kernel_dirs scan.
> +	 */
> +	if (!strchr(path, '/') && comp_dir && comp_dir[0] == '/') {
> +		static char buf[PATH_MAX];
> +
> +		snprintf(buf, sizeof(buf), "%s/%s", comp_dir, path);
> +		for (p = buf + 1; *p; p++) {
> +			if (*(p - 1) == '/') {
> +				for (unsigned int i = 0; i < sizeof(kernel_dirs) /
> +				     sizeof(kernel_dirs[0]); i++) {
> +					if (!strncmp(p, kernel_dirs[i],
> +						     strlen(kernel_dirs[i])))
> +						return p;
> +				}
> +			}
> +		}
> +	}
> +
> +	return path;
>  }
>  
>  static int compare_entries(const void *a, const void *b)
> @@ -248,6 +290,159 @@ static unsigned long long find_text_addr(Elf *elf)
>  	exit(1);
>  }
>  
> +static void find_text_section_range(Elf *elf)
> +{
> +	Elf_Scn *scn = NULL;
> +	GElf_Shdr shdr;
> +	size_t shstrndx;
> +
> +	if (elf_getshdrstrndx(elf, &shstrndx) != 0)
> +		return;
> +
> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> +		const char *name;
> +
> +		if (!gelf_getshdr(scn, &shdr))
> +			continue;
> +		name = elf_strptr(elf, shstrndx, shdr.sh_name);
> +		if (name && !strcmp(name, ".text")) {
> +			text_section_start = shdr.sh_addr;
> +			text_section_end = shdr.sh_addr + shdr.sh_size;
> +			return;
> +		}
> +	}
> +}
> +
> +/*
> + * Apply .rela.debug_line relocations to a mutable copy of .debug_line data.
> + *
> + * elfutils libdw (through at least 0.194) does NOT apply relocations for
> + * ET_REL files when using dwarf_begin_elf().  The internal libdwfl layer
> + * does this via __libdwfl_relocate(), but that API is not public.
> + *
> + * For DWARF5, the .debug_line file name table uses DW_FORM_line_strp
> + * references into .debug_line_str.  Without relocation, all these offsets
> + * resolve to 0 (or garbage), causing dwarf_linesrc()/dwarf_filesrc() to
> + * return wrong filenames (typically the comp_dir for every file).
> + *
> + * This function applies the relocations manually so that the patched
> + * .debug_line data can be fed to dwarf_begin_elf() and produce correct
> + * results.
> + *
> + * See elfutils bug https://sourceware.org/bugzilla/show_bug.cgi?id=31447
> + * A fix (dwelf_elf_apply_relocs) was proposed but not yet merged as of
> + * elfutils 0.194: https://sourceware.org/pipermail/elfutils-devel/2024q3/007388.html
> + */
> +/*
> + * Determine the relocation type for a 32-bit absolute reference
> + * on the given architecture.  Returns 0 if unknown.
> + */
> +static unsigned int r_type_abs32(unsigned int e_machine)
> +{
> +	switch (e_machine) {
> +	case EM_X86_64:		return 10;	/* R_X86_64_32 */
> +	case EM_386:		return 1;	/* R_386_32 */
> +	case EM_AARCH64:	return 258;	/* R_AARCH64_ABS32 */
> +	case EM_ARM:		return 2;	/* R_ARM_ABS32 */
> +	case EM_RISCV:		return 1;	/* R_RISCV_32 */
> +	case EM_S390:		return 4;	/* R_390_32 */
> +	case EM_MIPS:		return 2;	/* R_MIPS_32 */
> +	case EM_PPC64:		return 1;	/* R_PPC64_ADDR32 */
> +	case EM_PPC:		return 1;	/* R_PPC_ADDR32 */
> +	case EM_LOONGARCH:	return 1;	/* R_LARCH_32 */
> +	case EM_PARISC:		return 1;	/* R_PARISC_DIR32 */
> +	default:		return 0;

The source file already includes elf.h from elfutils. Is it necessary to
hardcode these relocation values here?

> +	}
> +}
> +
> +static void apply_debug_line_relocations(Elf *elf)
> +{
> +	Elf_Scn *scn = NULL;
> +	Elf_Scn *debug_line_scn = NULL;
> +	Elf_Scn *rela_debug_line_scn = NULL;
> +	Elf_Scn *symtab_scn = NULL;
> +	GElf_Shdr shdr;
> +	GElf_Ehdr ehdr;
> +	unsigned int abs32_type;
> +	size_t shstrndx;
> +	Elf_Data *dl_data, *rela_data, *sym_data;
> +	GElf_Shdr rela_shdr, sym_shdr;
> +	size_t nrels, i;
> +
> +	if (gelf_getehdr(elf, &ehdr) == NULL)
> +		return;
> +
> +	abs32_type = r_type_abs32(ehdr.e_machine);
> +	if (!abs32_type)
> +		return;
> +
> +	if (elf_getshdrstrndx(elf, &shstrndx) != 0)
> +		return;
> +
> +	/* Find the relevant sections */
> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> +		const char *name;
> +
> +		if (!gelf_getshdr(scn, &shdr))
> +			continue;
> +		name = elf_strptr(elf, shstrndx, shdr.sh_name);
> +		if (!name)
> +			continue;
> +
> +		if (!strcmp(name, ".debug_line"))
> +			debug_line_scn = scn;
> +		else if (!strcmp(name, ".rela.debug_line"))
> +			rela_debug_line_scn = scn;
> +		else if (shdr.sh_type == SHT_SYMTAB)
> +			symtab_scn = scn;
> +	}
> +
> +	if (!debug_line_scn || !rela_debug_line_scn || !symtab_scn)
> +		return;
> +
> +	dl_data = elf_getdata(debug_line_scn, NULL);
> +	rela_data = elf_getdata(rela_debug_line_scn, NULL);
> +	sym_data = elf_getdata(symtab_scn, NULL);
> +	if (!dl_data || !rela_data || !sym_data)
> +		return;
> +
> +	if (!gelf_getshdr(rela_debug_line_scn, &rela_shdr))
> +		return;
> +	if (!gelf_getshdr(symtab_scn, &sym_shdr))
> +		return;
> +
> +	nrels = rela_shdr.sh_size / rela_shdr.sh_entsize;
> +
> +	for (i = 0; i < nrels; i++) {
> +		GElf_Rela rela;
> +		GElf_Sym sym;
> +		unsigned int r_type;
> +		size_t r_sym;
> +		uint32_t value;
> +
> +		if (!gelf_getrela(rela_data, i, &rela))
> +			continue;
> +
> +		r_type = GELF_R_TYPE(rela.r_info);
> +		r_sym = GELF_R_SYM(rela.r_info);
> +
> +		/* Only handle the 32-bit absolute reloc for this arch */
> +		if (r_type != abs32_type)
> +			continue;
> +
> +		if (!gelf_getsym(sym_data, r_sym, &sym))
> +			continue;
> +
> +		/* Relocated value = sym.st_value + addend */
> +		value = (uint32_t)(sym.st_value + rela.r_addend);
> +
> +		/* Patch the .debug_line data at the relocation offset */
> +		if (rela.r_offset + 4 <= dl_data->d_size)
> +			memcpy((char *)dl_data->d_buf + rela.r_offset,
> +			       &value, sizeof(value));
> +	}
> +}
> +
>  static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
>  {
>  	Dwarf_Off off = 0, next_off;
> @@ -295,6 +490,16 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
>  			if (addr < text_addr)
>  				continue;
>  
> +			/*
> +			 * In module mode, keep only .text addresses.
> +			 * In ET_REL .ko files, .init.text/.exit.text may
> +			 * overlap with .text address ranges, so we must
> +			 * explicitly check against the .text bounds.
> +			 */

Nit: The use of "may" in this comment seems strange. It is fully
expected that .text, .init.text, .exit.text or any other section will
have their sh_addr set to 0 in relocatable objects and therefore the
sections have overlapping address ranges.

> +			if (module_mode && text_section_end > text_section_start &&
> +			    (addr < text_section_start || addr >= text_section_end))
> +				continue;
> +

The current code is very specific to the .text section. It would be good
to cover all sections in the future. I think it will naturally require
use of relocations to refer to individual sections.

>  			{
>  				unsigned long long raw_offset = addr - text_addr;
>  
> @@ -440,6 +645,63 @@ static void output_assembly(void)
>  	printf("\n");
>  }
>  
> +static void output_module_assembly(void)
> +{
> +	unsigned int filenames_size = 0;
> +
> +	for (unsigned int i = 0; i < num_files; i++)
> +		filenames_size += strlen(files[i].name) + 1;
> +
> +	printf("/* SPDX-License-Identifier: GPL-2.0 */\n");
> +	printf("/*\n");
> +	printf(" * Automatically generated by scripts/gen_lineinfo --module\n");
> +	printf(" * Do not edit.\n");
> +	printf(" */\n\n");
> +
> +	printf("\t.section .mod_lineinfo, \"a\"\n\n");
> +
> +	/* Header: num_entries, num_files, filenames_size, reserved */
> +	printf("\t.balign 4\n");
> +	printf("\t.long %u\n", num_entries);
> +	printf("\t.long %u\n", num_files);
> +	printf("\t.long %u\n", filenames_size);
> +	printf("\t.long 0\n\n");
> +
> +	/* addrs[] */
> +	for (unsigned int i = 0; i < num_entries; i++)
> +		printf("\t.long 0x%x\n", entries[i].offset);
> +	if (num_entries)
> +		printf("\n");
> +
> +	/* file_ids[] */
> +	for (unsigned int i = 0; i < num_entries; i++)
> +		printf("\t.short %u\n", entries[i].file_id);
> +
> +	/* Padding to align lines[] to 4 bytes */
> +	if (num_entries & 1)
> +		printf("\t.short 0\n");
> +	if (num_entries)
> +		printf("\n");
> +
> +	/* lines[] */
> +	for (unsigned int i = 0; i < num_entries; i++)
> +		printf("\t.long %u\n", entries[i].line);
> +	if (num_entries)
> +		printf("\n");
> +
> +	/* file_offsets[] */
> +	for (unsigned int i = 0; i < num_files; i++)
> +		printf("\t.long %u\n", files[i].str_offset);
> +	if (num_files)
> +		printf("\n");
> +
> +	/* filenames[] */
> +	for (unsigned int i = 0; i < num_files; i++)
> +		print_escaped_asciz(files[i].name);
> +	if (num_files)
> +		printf("\n");
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	int fd;
> @@ -447,12 +709,23 @@ int main(int argc, char *argv[])
>  	Dwarf *dwarf;
>  	unsigned long long text_addr;
>  
> +	if (argc >= 2 && !strcmp(argv[1], "--module")) {
> +		module_mode = 1;
> +		argv++;
> +		argc--;
> +	}
> +
>  	if (argc != 2) {
> -		fprintf(stderr, "Usage: %s <vmlinux>\n", argv[0]);
> +		fprintf(stderr, "Usage: %s [--module] <ELF file>\n", argv[0]);
>  		return 1;
>  	}
>  
> -	fd = open(argv[1], O_RDONLY);
> +	/*
> +	 * For module mode, open O_RDWR so we can apply debug section
> +	 * relocations to the in-memory ELF data.  The modifications
> +	 * are NOT written back to disk (no elf_update() call).
> +	 */
> +	fd = open(argv[1], module_mode ? O_RDWR : O_RDONLY);
>  	if (fd < 0) {
>  		fprintf(stderr, "Cannot open %s: %s\n", argv[1],
>  			strerror(errno));
> @@ -460,7 +733,7 @@ int main(int argc, char *argv[])
>  	}
>  
>  	elf_version(EV_CURRENT);
> -	elf = elf_begin(fd, ELF_C_READ, NULL);
> +	elf = elf_begin(fd, module_mode ? ELF_C_RDWR : ELF_C_READ, NULL);
>  	if (!elf) {
>  		fprintf(stderr, "elf_begin failed: %s\n",
>  			elf_errmsg(elf_errno()));
> @@ -468,7 +741,22 @@ int main(int argc, char *argv[])
>  		return 1;
>  	}
>  
> -	text_addr = find_text_addr(elf);
> +	if (module_mode) {
> +		/*
> +		 * .ko files are ET_REL after ld -r.  libdw does NOT apply
> +		 * relocations for ET_REL files, so DW_FORM_line_strp
> +		 * references in .debug_line are not resolved.  Apply them
> +		 * ourselves so that dwarf_linesrc() returns correct paths.
> +		 *
> +		 * DWARF addresses include the .text sh_addr.  Use .text
> +		 * sh_addr as the base so offsets are .text-relative.
> +		 */
> +		apply_debug_line_relocations(elf);
> +		find_text_section_range(elf);
> +		text_addr = text_section_start;
> +	} else {
> +		text_addr = find_text_addr(elf);
> +	}
>  
>  	dwarf = dwarf_begin_elf(elf, DWARF_C_READ, NULL);
>  	if (!dwarf) {
> @@ -494,7 +782,10 @@ int main(int argc, char *argv[])
>  	fprintf(stderr, "lineinfo: %u entries, %u files\n",
>  		num_entries, num_files);
>  
> -	output_assembly();
> +	if (module_mode)
> +		output_module_assembly();
> +	else
> +		output_assembly();
>  
>  	dwarf_end(dwarf);
>  	elf_end(elf);

-- 
Thanks,
Petr


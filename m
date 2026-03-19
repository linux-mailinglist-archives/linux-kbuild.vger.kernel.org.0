Return-Path: <linux-kbuild+bounces-12083-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFUFNWoqvGn4twIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12083-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 17:55:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8062CF311
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 17:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10CB232851C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 16:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F562C21C5;
	Thu, 19 Mar 2026 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGYxvByH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98EF3EE1C1;
	Thu, 19 Mar 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938622; cv=none; b=MiVFezGho297odAIEx/EDWDeG4L6qDLaptin38Q7apleUKRrmKvJlSxpItNmnn0lIS8WdnMzaw3sXkEZ87P7QdWoS5H7CGRcDpXVMA25Oatp1S6xasBLOIJ9xQRxFsmdozGQQjwQNMY9gfZWa7Za69C3eyCTYouqLtfNa4fbIUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938622; c=relaxed/simple;
	bh=foBUrcbmXINTonPyjYsnHAi+9wmraBkIDrk1yWtnsHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ej9oz1x6h6CExt8HFgQsZMDdLjT7jWrSK4YRpQJwcVLvBIE3v7ZN5Tpja4g0oX2tk2BeGMKXtHhsz/tbz5+oDHvkntH62bZBDTx9bl+GCYCezkzrW9V0aoN+5PhIDXt7Q6QWH/PkRHrKog1vJMUUE9F2eo7gsbYxTErJq8vcP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGYxvByH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469AAC19424;
	Thu, 19 Mar 2026 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938622;
	bh=foBUrcbmXINTonPyjYsnHAi+9wmraBkIDrk1yWtnsHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGYxvByHR8IMCBbE9lLP8SI9qKS5gE9a/ge4KGQlf2AePTC7OrgSr0mA+iYehVUwL
	 5+t81zao17yDB4cqp+Rds62nIQWtHEm+DPwbUqnVI38ANbgc/cgTzxaGiU03viLzNa
	 WXvO5zJ0eNT9Tx4eGjHlyRxzEpPPtX9HxCKEJ+dgS+6xZAjVRRNhj9qOB3ZW679e87
	 yr4ZDeJpUT7sXZPqw29rekm1R4pcQrFNN9APQukJ4mt4zTYZo1ds90NdSUvPEtDt9A
	 HMyzfLzWWzqryREHu4C5bGP74SgfZfhre+Dbglyn7Sg8JaxbHRR5PQgymGb+a9+DfB
	 N1qmt7E7DgAiA==
Date: Thu, 19 Mar 2026 12:43:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] kallsyms: extend lineinfo to loadable modules
Message-ID: <abwnvdbu4kjx7esJ@laps>
References: <20260312030649.674699-1-sashal@kernel.org>
 <20260312030649.674699-3-sashal@kernel.org>
 <79244e56-b3ea-4986-b4a2-91a78b21bf07@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79244e56-b3ea-4986-b4a2-91a78b21bf07@suse.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12083-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,nod.at,suse.com,linux-m68k.org,hansenpartnership.com,lwn.net,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E8062CF311
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for the great review!

On Thu, Mar 19, 2026 at 11:37:18AM +0100, Petr Pavlu wrote:
>On 3/12/26 4:06 AM, Sasha Levin wrote:
>> +- **No init text**: For modules, functions in ``.init.text`` are not annotated
>> +  because that memory is freed after module initialization.
>
>A second table .init.mod_lineinfo could be added to provide the
>necessary information for .init sections, which would be dropped along
>with all the other init code+data.

Sure, it's something we can look at it later. For this series I'd like to keep
scope to runtime .text, since init code runs briefly and rarely appears in
stack traces that need debugging. Adding a second section would require module
loader changes for loading and freeing it alongside init memory.

>> --- /dev/null
>> +++ b/include/linux/mod_lineinfo.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * mod_lineinfo.h - Binary format for per-module source line information
>> + *
>> + * This header defines the layout of the .mod_lineinfo section embedded
>> + * in loadable kernel modules.  It is dual-use: included from both the
>> + * kernel and the userspace gen_lineinfo tool.
>> + *
>> + * Section layout (all values in target-native endianness):
>> + *
>> + *   struct mod_lineinfo_header     (16 bytes)
>> + *   u32 addrs[num_entries]         -- offsets from .text base, sorted
>
>Modules are relocatable objects. The typical way to express a reference
>from one section to data in another section is to use relocations.
>Choosing to use an implicit base and resolved offsets means that the
>code has trouble correctly referencing the .text section and can't
>express line information data for other sections, such as .exit.text.

I agree, which is why I scoped this just to .text :)

My thinking was that using ELF relocations would add significant complexity to
both the build tool and the runtime lookup path, which must remain NMI-safe and
allocation-free.

>> + *   u16 file_ids[num_entries]      -- parallel to addrs
>> + *   <2-byte pad if num_entries is odd>
>> + *   u32 lines[num_entries]         -- parallel to addrs
>> + *   u32 file_offsets[num_files]    -- byte offset into filenames[]
>> + *   char filenames[filenames_size] -- concatenated NUL-terminated strings
>
>Nit: The description could be a bit easier to navigate if the
>mod_lineinfo_header struct was expanded, so it is clear where
>num_entries, num_files and filenames_size come from.

Makes sense

>> + */
>> +#ifndef _LINUX_MOD_LINEINFO_H
>> +#define _LINUX_MOD_LINEINFO_H
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/types.h>
>> +#else
>> +#include <stdint.h>
>> +typedef uint32_t u32;
>> +typedef uint16_t u16;
>> +#endif
>> +
>> +struct mod_lineinfo_header {
>> +	u32 num_entries;
>> +	u32 num_files;
>> +	u32 filenames_size;	/* total bytes of concatenated filenames */
>
>An alternative would be to say that the filenames data extends to the
>end of the section, without requiring an explicit filenames_size.

I'd prefer to keep filenames_size explicit: it allows lineinfo_search() to
validate filename offsets without knowing the section size. This keeps the
search function reusable between vmlinux (where data comes from linker globals
with no "section size") and modules (where it comes from a section). The cost
is 4 bytes per module.

>> +	u32 reserved;		/* padding, must be 0 */
>
>I believe the format should remain internal to the kernel, so there is
>no need for such a reserved member.

The format is indeed internal and we don't generally concern ourselves with
out-of-tree modules. I've originally added it as a minimal safety net: if the
format ever changes and a stale .ko with an old-format .mod_lineinfo gets
loaded, the kernel would silently misparse lineinfo data.

I don't feel too strongly about it either way, but 4 bytes felt a pretty cheap
price to pay for this safety net :)

>> +static inline u32 mod_lineinfo_lines_off(u32 num_entries)
>> +{
>> +	/* u16 file_ids[] may need 2-byte padding to align lines[] to 4 bytes */
>> +	u32 off = mod_lineinfo_file_ids_off(num_entries) +
>> +		  num_entries * sizeof(u16);
>> +	return (off + 3) & ~3u;
>> +}
>> +
>> +static inline u32 mod_lineinfo_file_offsets_off(u32 num_entries)
>> +{
>> +	return mod_lineinfo_lines_off(num_entries) + num_entries * sizeof(u32);
>> +}
>> +
>> +static inline u32 mod_lineinfo_filenames_off(u32 num_entries, u32 num_files)
>> +{
>> +	return mod_lineinfo_file_offsets_off(num_entries) +
>> +	       num_files * sizeof(u32);
>> +}
>
>These helpers are used only from kernel/module/kallsyms.c. I assume they
>are present in this header file to stay close to the description of the
>format.
>
>I personally find them quite verbose. The module_lookup_lineinfo()
>function needs an intimate knowledge of the data format anyway. The code
>in module_lookup_lineinfo() could be replaced with just:
>
>	addrs = base + sizeof(struct mod_lineinfo_header);
>	file_ids = addrs + num_entries * sizeof(u32);
>	lines = (file_ids + num_entries * sizeof(u16) + 3) & ~3u;
>	file_offsets = lines + num_entries * sizeof(u32);
>	filenames = file_offsets + num_files * sizeof(u32);

They are very verbose mostly to make it easy for me to understand :)

Note that the next patch which adds compression rewrites these completely.

I kept these here just to make it easier to understand what's happening during
my development work as well as reviews.

>> +
>> +#endif /* _LINUX_MOD_LINEINFO_H */
>> diff --git a/include/linux/module.h b/include/linux/module.h
>> index 14f391b186c6d..d23e0cd9c7210 100644
>> --- a/include/linux/module.h
>> +++ b/include/linux/module.h
>> @@ -508,6 +508,8 @@ struct module {
>>  	void *btf_data;
>>  	void *btf_base_data;
>>  #endif
>> +	void *lineinfo_data;		/* .mod_lineinfo section in MOD_RODATA */
>> +	unsigned int lineinfo_data_size;
>
>The lineinfo-specific members should be enclosed within the `#ifdef
>CONFIG_KALLSYMS_LINEINFO_MODULES`.
>
>This will require module_lookup_lineinfo() to be conditionally compiled
>based on CONFIG_KALLSYMS_LINEINFO_MODULES, with a dummy version provided
>otherwise. Alternatively, accessors to module::lineinfo_data and
>module::lineinfo_data_size that handle CONFIG_KALLSYMS_LINEINFO_MODULES
>could be introduced in include/linux/module.h. For example, see
>module_buildid() or is_livepatch_module.

The struct members were deliberately left without #ifdef guards following Helge
Deller's suggestion in the v1 review[1]. I don't really mind either way, but
I'd prefer to have a consensus before flipping it back and forth.

Helge?

[1] https://lore.kernel.org/all/3ab0cad6-bf55-4ae5-afb7-d9129ac2032e@gmx.de/

>> +	addrs = base + mod_lineinfo_addrs_off();
>> +	file_ids = base + mod_lineinfo_file_ids_off(num_entries);
>> +	lines = base + mod_lineinfo_lines_off(num_entries);
>> +	file_offsets = base + mod_lineinfo_file_offsets_off(num_entries);
>> +	filenames = base + mod_lineinfo_filenames_off(num_entries, num_files);
>> +
>> +	/* Compute offset from module .text base */
>> +	text_base = (unsigned long)mod->mem[MOD_TEXT].base;
>
>The module::mem[] covers module memory regions. One can think of them as
>ELF segments, except they are created dynamically by the module loader.
>The code conflates the .text section and the TEXT segment. I'm not aware
>of any guarantee that the .text section will be always placed as the
>first section in this segment.

You're right that this conflates section and segment. In practice, .text is
always first in MOD_TEXT because __layout_sections() processes SHF_EXECINSTR
sections in ELF order, and .text is conventionally first.  But I agree this
shouldn't be an implicit assumption.

We can add a validation check at module load time to verify the assumption
for now, and address it better when ...

>Relocations can be used to accurately reference the .text section.

... we add full relocation support.

>> +	if (addr < text_base)
>> +		return false;
>> +
>> +	raw_offset = addr - text_base;
>> +	if (raw_offset > UINT_MAX)
>
>The offsets in the addrs array are of the u32 type, so this should be
>strictly speaking checked against U32_MAX.

Right

>> --- a/scripts/Makefile
>> +++ b/scripts/Makefile
>> @@ -5,6 +5,7 @@
>>
>>  hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
>>  hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO)		+= gen_lineinfo
>> +hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO_MODULES)	+= gen_lineinfo
>
>This line is unnecessary because CONFIG_KALLSYMS_LINEINFO_MODULES
>depends on CONFIG_KALLSYMS_LINEINFO.

It is. I mostly left it here for clarity's sake. I'll drop it. 

>> @@ -59,6 +62,9 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>>  	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
>>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>>  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
>> +endif
>> +ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
>> +	+$(if $(newer-prereqs),$(call cmd,lineinfo_ko))
>
>Should this be 'if_changed_except.. vmlinux'?

Lineinfo generation doesn't depend on vmlinux - it reads DWARF directly from
the .ko file itself. Unlike BTF (which uses vmlinux as a base for
deduplication), there's no vmlinux prerequisite to exclude.

>> @@ -194,9 +200,45 @@ static const char *make_relative(const char *path, const char *comp_dir)
>>  		return p ? p + 1 : path;
>>  	}
>>
>> -	/* Fall back to basename */
>> -	p = strrchr(path, '/');
>> -	return p ? p + 1 : path;
>> +	/*
>> +	 * Relative path — check for duplicated-path quirk from libdw
>> +	 * on ET_REL files (e.g., "a/b.c/a/b.c" → "a/b.c").
>> +	 */
>
>When does this quirk occur? Is it a bug in libdw?

This occurs with elfutils libdw when processing ET_REL .ko files.  libdw
constructs source paths by concatenating DW_AT_comp_dir with DW_AT_name from
the compilation unit. For modules where both are relative paths with the same
prefix, this can produce doubled results like "net/foo/bar.c/net/foo/bar.c". It
appears to be a libdw quirk with ET_REL DWARF handling.

>> +	{
>> +		size_t len = strlen(path);
>> +
>> +		for (p = path; (p = strchr(p, '/')) != NULL; p++) {
>> +			size_t prefix = p - path;
>> +			size_t rest = len - prefix - 1;
>> +
>> +			if (rest == prefix && !memcmp(path, p + 1, prefix))
>> +				return p + 1;
>> +		}
>
>Isn't this loop same as:
>
>size_t mid = len / 2;
>if (path[mid] == '/' && !memcmp(path, path + mid + 1, mid - 1))
>	return path + mid + 1;

I think so! For a true duplication "X/X", the split is always at the exact
midpoint (len/2), so the loop over every '/' is unnecessary. I'll adopt this
approach with the memcmp length as `mid` rather than `mid - 1` to compare the
full second half.

>> +static unsigned int r_type_abs32(unsigned int e_machine)
>> +{
>> +	switch (e_machine) {
>> +	case EM_X86_64:		return 10;	/* R_X86_64_32 */
>> +	case EM_386:		return 1;	/* R_386_32 */
>> +	case EM_AARCH64:	return 258;	/* R_AARCH64_ABS32 */
>> +	case EM_ARM:		return 2;	/* R_ARM_ABS32 */
>> +	case EM_RISCV:		return 1;	/* R_RISCV_32 */
>> +	case EM_S390:		return 4;	/* R_390_32 */
>> +	case EM_MIPS:		return 2;	/* R_MIPS_32 */
>> +	case EM_PPC64:		return 1;	/* R_PPC64_ADDR32 */
>> +	case EM_PPC:		return 1;	/* R_PPC_ADDR32 */
>> +	case EM_LOONGARCH:	return 1;	/* R_LARCH_32 */
>> +	case EM_PARISC:		return 1;	/* R_PARISC_DIR32 */
>> +	default:		return 0;
>
>The source file already includes elf.h from elfutils. Is it necessary to
>hardcode these relocation values here?

Right!

>>  static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
>>  {
>>  	Dwarf_Off off = 0, next_off;
>> @@ -295,6 +490,16 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
>>  			if (addr < text_addr)
>>  				continue;
>>
>> +			/*
>> +			 * In module mode, keep only .text addresses.
>> +			 * In ET_REL .ko files, .init.text/.exit.text may
>> +			 * overlap with .text address ranges, so we must
>> +			 * explicitly check against the .text bounds.
>> +			 */
>
>Nit: The use of "may" in this comment seems strange. It is fully
>expected that .text, .init.text, .exit.text or any other section will
>have their sh_addr set to 0 in relocatable objects and therefore the
>sections have overlapping address ranges.

I guess I wasn't sure if it's really always the case. We can adjust the comment.

>> +			if (module_mode && text_section_end > text_section_start &&
>> +			    (addr < text_section_start || addr >= text_section_end))
>> +				continue;
>> +
>
>The current code is very specific to the .text section. It would be good
>to cover all sections in the future. I think it will naturally require
>use of relocations to refer to individual sections.

Yup, we can definitely give it a go in the future.

-- 
Thanks,
Sasha


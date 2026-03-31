Return-Path: <linux-kbuild+bounces-12408-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDRdMor2y2kGNAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12408-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:30:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018336CA6F
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0057302E0E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872E03FADF9;
	Tue, 31 Mar 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cnj2oWuj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7598E3D75D9
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974207; cv=none; b=uCevKyk65NmmuDOBo+8F7CceEKX1a06ebwH1FpvTe4KD/zYdkld0koZPAwrRErgZDjri8U3NruhSFrU/5JfHh2gzUesKtRH2FH+3N/TgvYkNIumQZbb3AEughXyNg5Zp60gT1ta2PsCF/2IT3Ln5qNfJAqHZJ3WpwtUmrD8l+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974207; c=relaxed/simple;
	bh=E9q4kly1zyjlK/nXHV+iHGk+ZJrgY6vQu+gb1CC1Krs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIlU/WudMKQOocHoZ8q2yKb0KqmeasHs1bKvMwXz80wTxdyVVRh5ah/Do7jT+w6sHocq1b/2HQbMc2U6k0kwZMrcJgvbu4c44OASHnvMJL38PppD/bQT7PeXnUXyguqJjNkuSRgeOHKrvHsdGPn76NjpEh8fnX+FZMgS73eipeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cnj2oWuj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso50654555e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 09:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774974204; x=1775579004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8VbtpEHRuJbj4APKjXIpLAw6vG+/+ZV8XZtpmo84AQ=;
        b=cnj2oWujeG+Rd+Hh3BuIEI52IxN+ltrvQbSaXlh63V58EhVnIqrvP4UN98ZQoSaal2
         FkambSz0nhw5pw6SnVVBP8D9sYn9SLwRgUrJThe+5c+gPaW/lKxmq5gsvK1qegFo4/sl
         x8eP6i/SH3sjN4bpzSxZVwoZPPKWrslFwafej79CTARoc5/UUHkuiccWoGLtLdzqvN/O
         s3/+he6+2fdCWHgGZALQ9AlNuTqpagwl+UN1T63uCLNInXvzCLLZSq/Hjt5eA0V9smkq
         Br3eo1gM8CVYRCgwCDsfAQJn8YdJkx29/h7N4tGJnYAx7zguz5RFjUORmwg+XSMMICoC
         Isug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774974204; x=1775579004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8VbtpEHRuJbj4APKjXIpLAw6vG+/+ZV8XZtpmo84AQ=;
        b=P7G8gCydbFKkpJFljeA1AzNsZB7QHJSL6eD9F5wjyp6x05KfsE6LZ1Hg2o2uV9a26g
         7/0COC2XTfw6MM8FLS7hWsvg4njM1ryNYaftPXigbAxaQOk8RwW2ioY98Rms/3u5HPnE
         lzRaFDznzz1lYh6qw5huxgXVPR5/Nq6RGwX45HaVDyCHJbGo0TLrtA+NZ3Rxp8C7Dk0N
         fC0uP8fEed4EBZYWHog/mTEZ/l0/GSfhJ1kDDWqTDMhSwgDvL+zIpLhzlGS54vAL5r2/
         8bTdzY/ihygIBV3xpXdoItCq1GujWWE3u09UXQrj6lG7aAfIcRmVoHG632wqocPtShcf
         FaTA==
X-Forwarded-Encrypted: i=1; AJvYcCWzzw9g7Vlc5VOVBQ8LlM1w4G56J/fBp3SBPlCzRxLQogOdeMUrc6VwnOjLFbosqDOkPmRV9fyfGC9uk2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwayBmhfIzaAZGHdAnfAPECjBMHKd71+efzxHwoOunsiqs+vqEC
	kZhGhpAgCyHWb8bR6doatYOFC1IgqDQPX8p0VqXPiodKFaJSPNgbwPzK/kYDaUummOE=
X-Gm-Gg: ATEYQzyy2+URXkKs4UmttJDstTOtgIZDh5IXof/DPIgrcVF/5v2bbpv3KFE0NruMTFQ
	DKG0L2hIOTKs77Piy+hAUHXvF2yJAvrBzNs2Fmx4/DBYdR5cISRtpGioK+V/CNDhGF1Ed0luDpk
	raaHoBFsal+WNfIvwWw2RSPAlG54y0kssWo9NboTzO27u0Ybq3R47I/qwkcM4GMMOHUwJQXZScI
	3cAMX9EXB/0UQqDLN5q+9/kZy39OcmR8JmC+MgQNOecbbPK8S8JqsKXQrthrbL0L6useSGpeHCe
	miT9xaZ3DgQjxFD4Nlck1aoHDJ3cmrdUvF37vYp2Lxzup5KOVzeOHK7RpI+VfG/nN6eY2dpq/ko
	AI/fAY65+QLg9173qzT3qaSPQY89N5V/Mry1TACr7V4WawZQ66FAOG21g1XNLJ3ecu9u6+sPNYY
	tySH6ZhNe75TmsOoBNIxwqQqkg2/OPIabLcS5sF4XpN9CPdGfz2nFa2QVrqxt9XxPZ96w44YNOW
	3Xa+V5U2SaM7Uqt0Oms6mgu8Jt9x6HdV4hI0rVySnCWj+wXahqxZEyPvpwI5zhMGG7bVPm7mdx3
	8dFz
X-Received: by 2002:a05:600c:45d4:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-48879a3f26cmr64380275e9.27.1774974203573;
        Tue, 31 Mar 2026 09:23:23 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887adc5690sm34644865e9.2.2026.03.31.09.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:23:23 -0700 (PDT)
Message-ID: <2fb64da1-caac-4cb0-80a8-a6b6a0f690be@suse.com>
Date: Tue, 31 Mar 2026 18:23:21 +0200
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
 James Bottomley <James.Bottomley@hansenpartnership.com>,
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
 <79244e56-b3ea-4986-b4a2-91a78b21bf07@suse.com> <abwnvdbu4kjx7esJ@laps>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <abwnvdbu4kjx7esJ@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,nod.at,suse.com,linux-m68k.org,hansenpartnership.com,lwn.net,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12408-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 3018336CA6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 5:43 PM, Sasha Levin wrote:
>>> --- /dev/null
>>> +++ b/include/linux/mod_lineinfo.h
>>> @@ -0,0 +1,68 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * mod_lineinfo.h - Binary format for per-module source line information
>>> + *
>>> + * This header defines the layout of the .mod_lineinfo section embedded
>>> + * in loadable kernel modules.  It is dual-use: included from both the
>>> + * kernel and the userspace gen_lineinfo tool.
>>> + *
>>> + * Section layout (all values in target-native endianness):
>>> + *
>>> + *   struct mod_lineinfo_header     (16 bytes)
>>> + *   u32 addrs[num_entries]         -- offsets from .text base, sorted
>>
>> Modules are relocatable objects. The typical way to express a reference
>> from one section to data in another section is to use relocations.
>> Choosing to use an implicit base and resolved offsets means that the
>> code has trouble correctly referencing the .text section and can't
>> express line information data for other sections, such as .exit.text.
> 
> I agree, which is why I scoped this just to .text :)
> 
> My thinking was that using ELF relocations would add significant complexity to
> both the build tool and the runtime lookup path, which must remain NMI-safe and
> allocation-free.

I agree that using ELF relocations would be somewhat more complex. I had
a look at adding a new u32/u64 "target" member to the
mod_lineinfo_header struct which would point to the .text section in the
resulting module via an absolute relocation. The idea was to keep the
current offset and compression schema and only have a relocation that
identifies the associated text section. I hoped to replace the objcopy
steps in scripts/gen-mod-lineinfo.sh with an additional partial link to
combine ${KO} with ${KO}.lineinfo.o.

However, the issue with this approach is that the relocation in
${KO}.lineinfo.o cannot cross-reference the .text symbol in ${KO}. It
could be worked around by defining a start .text symbol in
scripts/module.lds.S but this doesn't scale well if more sections need
to be covered in the future. A separate utility would likely be required
to join the two objects properly together.

For the runtime part, I don't immediately see any issues. Relocations
are resolved by the module loader when a module is loaded, so this would
have no effect on the functionality being NMI-safe or allocation-free.

>>> +
>>> +#endif /* _LINUX_MOD_LINEINFO_H */
>>> diff --git a/include/linux/module.h b/include/linux/module.h
>>> index 14f391b186c6d..d23e0cd9c7210 100644
>>> --- a/include/linux/module.h
>>> +++ b/include/linux/module.h
>>> @@ -508,6 +508,8 @@ struct module {
>>>      void *btf_data;
>>>      void *btf_base_data;
>>>  #endif
>>> +    void *lineinfo_data;        /* .mod_lineinfo section in MOD_RODATA */
>>> +    unsigned int lineinfo_data_size;
>>
>> The lineinfo-specific members should be enclosed within the `#ifdef
>> CONFIG_KALLSYMS_LINEINFO_MODULES`.
>>
>> This will require module_lookup_lineinfo() to be conditionally compiled
>> based on CONFIG_KALLSYMS_LINEINFO_MODULES, with a dummy version provided
>> otherwise. Alternatively, accessors to module::lineinfo_data and
>> module::lineinfo_data_size that handle CONFIG_KALLSYMS_LINEINFO_MODULES
>> could be introduced in include/linux/module.h. For example, see
>> module_buildid() or is_livepatch_module.
> 
> The struct members were deliberately left without #ifdef guards following Helge
> Deller's suggestion in the v1 review[1]. I don't really mind either way, but
> I'd prefer to have a consensus before flipping it back and forth.

The alternative suggestion I mentioned proposes using accessors to
module::lineinfo_data and module::lineinfo_data_size that would handle
CONFIG_KALLSYMS_LINEINFO_MODULES. This approach avoids having unused
data in the module struct when CONFIG_KALLSYMS_LINEINFO_MODULES=n, while
also allowing module_lookup_lineinfo() to use the
IS_ENABLED(CONFIG_KALLSYMS_LINEINFO_MODULES) pattern and be always
syntax-checked. Only the accessors won't be always syntax-checked but
their code should be trivial.

The file include/linux/module.h could contain something like this:

struct {
	[...]
#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
	void *lineinfo_data;		/* .mod_lineinfo section in MOD_RODATA */
	unsigned int lineinfo_data_size;
#endif
	[...]
}

[...]

static inline void *module_lineinfo_data(struct module *mod, unsigned int *size)
{
#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
	*size = mod->lineinfo_data_size;
	return mod->lineinfo_data;
#else
	*size = 0;
	return NULL;
#endif
}

>>> @@ -59,6 +62,9 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>>>      +$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
>>>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>>>      +$(if $(newer-prereqs),$(call cmd,btf_ko))
>>> +endif
>>> +ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
>>> +    +$(if $(newer-prereqs),$(call cmd,lineinfo_ko))
>>
>> Should this be 'if_changed_except.. vmlinux'?
> 
> Lineinfo generation doesn't depend on vmlinux - it reads DWARF directly from
> the .ko file itself. Unlike BTF (which uses vmlinux as a base for
> deduplication), there's no vmlinux prerequisite to exclude.

The Makefile rule is:

%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE

If $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN)) then
$(objtree)/vmlinux is added as a prerequisite for the target. Since the
new lineinfo_ko call uses $(newer-prereqs), it is invoked even when
vmlinux changes.

However, the mentioned change to 'if_changed_except.. vmlinux' won't
quite work either because if_changed_except appears to have a similar
limitation as if_changed. It can be used only once per target due to
storing the executed command in a corresponding .cmd file.

Additionally, even the already present if_changed_except call for
ld_ko_o doesn't seem to work as intended because it excludes "./vmlinux"
but the same rule prerequisite is canonicalized to only "vmlinux". This
means modules are always linked even when only vmlinux changes. I'll
send a fix for this separately.

> 
>>> @@ -194,9 +200,45 @@ static const char *make_relative(const char *path, const char *comp_dir)
>>>          return p ? p + 1 : path;
>>>      }
>>>
>>> -    /* Fall back to basename */
>>> -    p = strrchr(path, '/');
>>> -    return p ? p + 1 : path;
>>> +    /*
>>> +     * Relative path — check for duplicated-path quirk from libdw
>>> +     * on ET_REL files (e.g., "a/b.c/a/b.c" → "a/b.c").
>>> +     */
>>
>> When does this quirk occur? Is it a bug in libdw?
> 
> This occurs with elfutils libdw when processing ET_REL .ko files.  libdw
> constructs source paths by concatenating DW_AT_comp_dir with DW_AT_name from
> the compilation unit. For modules where both are relative paths with the same
> prefix, this can produce doubled results like "net/foo/bar.c/net/foo/bar.c". It
> appears to be a libdw quirk with ET_REL DWARF handling.

Thanks for the explanation.

-- Petr


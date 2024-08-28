Return-Path: <linux-kbuild+bounces-3254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3096962720
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 14:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AC21F24AD8
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 12:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777B8176228;
	Wed, 28 Aug 2024 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ceZTy2QL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A4816D4C1
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848270; cv=none; b=uz2boOssiptZIOmHnuyUsMLkmcIBFyIHW3paI2kc7tLT2fY0sgy/euuntUQzf7OLPkbQ4p11y/hawbxJmpmlkYmUDyE4umzTNB0O1CYEJ3Xc2jsFJeLv1zA16lRKyNS/GBKArsc4y1Yn2TXSk7tmzmTq/H7/tJHkWyYmg+KZfaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848270; c=relaxed/simple;
	bh=yT8yqaGNeNQPTO7kAIHMQlRQrwRp5/fHqh9u6p0Uu1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6oaPu3YzSTIGZXqISvw8EK1yF7f8oPdd1TLZfc/3i1zp4UHgg/qzqdoPxi6ehK5LJBK9VkTXc8g+4H2ZFDEGdIb5+R6jkNUV+1Fr6yDb6GXVWB4DRxZLxfw3Gsq6nVs5Z88wjpMKGKEt2DfnoMrUosyzY3zncxE6WwPqcAMhnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ceZTy2QL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-371941bbfb0so3887123f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724848267; x=1725453067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97RTF+dpgpGQaMhBvDsJzwR8A1uS6k4qKn0LeXHonpE=;
        b=ceZTy2QLPsqRTXV3YqR4INy848I0t481vsJuFtHxiANuYvcPYsL6n4jqRsIJTTPEnq
         dufP97lydWARxEAKkuTxKo58osZ1/B4ruBQ/6hS0ClV4nvBa3hg06aUZw/ZJgi9sOfwo
         pZkXuHh3stTrBA4m6kPE4TLodTR/j+VFEnRiQKI1UPFdQAyFwJsaeD6bTwXzzwz4VsRY
         oZj8tlnGBw6gXXKdqNeTQUEyyP9q+OWSzDFpnIV01GPYC09UAtLPE3InYU92wJfEcGJb
         razJ4W7my+2v3RXe5l/djWxC/oApQKvJTCY4nDb5zDgjAF0C1TW85uf0+727UMQLxNua
         Qbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848267; x=1725453067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97RTF+dpgpGQaMhBvDsJzwR8A1uS6k4qKn0LeXHonpE=;
        b=PwZbOsrS7bmoOskttjnlzVDdppUHEQNmlfyoPvAvuJtMeuF1EAb/Cg1z1coeuCAArs
         0pYNDy8ajHvLvdcsfEni/1woTTCikQdDCnxeo2kwH1zOF5rqGuSvlry9S0NXOsrHyO7P
         I7KfB3AwzBtnIhl68khqEruh/RQI2degggbYG1LMJZU0FOaGLB/gWdZC4NTD2eliBc+d
         LVSmv1hBRznFWrRwH6ec2M+E5R0NfvIdbenERbm7N9Q2H8caZrYzGM/OSUo/392UsFAY
         SN8Ix6zw9kV4QDLrx54E0xDbY57QHTJsmNGTELfDlan/P1gUPdO3bthjQoJb4u7PTMt9
         I4hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMjCmlxfdm5G5vduxmZ+PKed/YeFIB+XjLkpeO6hReQ8oBVo3EmPr/z01StVW48/zCQkj+ZHepieUXBoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuSWUXG85rZiXdfvvnMQp5xduLdY/ZN9lckqKddmJ9STHPpD1p
	BuWvNhzbFqzUaKSrdLiT8yGG4YNQiAK0OC2w0tDIWsU6jEKuarwsBbFFJWuETEA=
X-Google-Smtp-Source: AGHT+IH4TigGxV8OPvwVxfj+AOpE9w26Vd8fbU/5v7j2ANhiwVGyf+VOZbm9gN7oSeAmM8WyvvtELQ==
X-Received: by 2002:a5d:6d8b:0:b0:367:9c12:3e64 with SMTP id ffacd0b85a97d-3749684c1admr1667714f8f.46.1724848266623;
        Wed, 28 Aug 2024 05:31:06 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582d878sm240255266b.119.2024.08.28.05.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 05:31:06 -0700 (PDT)
Message-ID: <80e7994d-f82e-4f2a-b233-d4f9d6900698@suse.com>
Date: Wed, 28 Aug 2024 14:31:05 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com>
 <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
 <CABCJKufveknkc_ribOBamC_MXRGounFkYBeRkKhppPSHijxtZg@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CABCJKufveknkc_ribOBamC_MXRGounFkYBeRkKhppPSHijxtZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/26/24 20:47, Sami Tolvanen wrote:
> On Mon, Aug 26, 2024 at 10:42 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>> On 8/15/24 19:39, Sami Tolvanen wrote:
>>> [...]
>>> +int main(int argc, const char **argv)
>>> +{
>>> +     unsigned int n;
>>> +
>>> +     if (parse_options(argc, argv) < 0)
>>> +             return usage();
>>> +
>>> +     for (n = 0; n < object_count; n++) {
>>> +             Dwfl *dwfl;
>>> +             int fd;
>>> +
>>> +             fd = open(object_files[n], O_RDONLY);
>>> +             if (fd == -1) {
>>> +                     error("open failed for '%s': %s", object_files[n],
>>> +                           strerror(errno));
>>> +                     return -1;
>>> +             }
>>> +
>>> +             dwfl = dwfl_begin(&callbacks);
>>> +             if (!dwfl) {
>>> +                     error("dwfl_begin failed for '%s': %s", object_files[n],
>>> +                           dwarf_errmsg(-1));
>>> +                     return -1;
>>> +             }
>>> +
>>> +             if (!dwfl_report_offline(dwfl, object_files[n], object_files[n],
>>> +                                      fd)) {
>>> +                     error("dwfl_report_offline failed for '%s': %s",
>>> +                           object_files[n], dwarf_errmsg(-1));
>>> +                     return -1;
>>> +             }
>>> +
>>> +             dwfl_report_end(dwfl, NULL, NULL);
>>> +
>>> +             if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
>>> +                     error("dwfl_getmodules failed for '%s'",
>>> +                           object_files[n]);
>>> +                     return -1;
>>> +             }
>>
>> I see that libdwfl has also directly function dwfl_nextcu(). Would it
>> make sense to use it to simplify the code?
> 
> How do you propose using the function? This loop goes through multiple
> input files, should we need them, and we iterate through all the CUs
> in process_modules.

I was thinking it could be possible to replace the code to traverse
modules and their their CUs, that is functions process_modules() and
process_module(), with dwfl_nextcu(). However, I now notice that more
work is added in subsequent patches to process_modules() so this
wouldn't quite work.

I would then only suggest to change some function names in the current
code. Function process_modules() is a callback to process a single
module and so it would be better to name it process_module(). The
present function process_module() actually processes a compilation unit
DIE so I would rename it to something like process_cu().

On 8/15/24 19:39, Sami Tolvanen wrote:
> +int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie)
> +{
> +	struct state state = { .mod = mod, .dbg = dbg };
> +
> +	return check(process_die_container(
> +		&state, cudie, process_exported_symbols, match_all));
> +}

Mostly a minor suggestion too.. Looking at the entire series, state.mod
ends up unused and state.dbg is only used in process_cached() where it
could be possibly replaced by doing dwarf_cu_getdwarf(die->cu)?

Removing these two members from the state struct would then allow to
instantiate a new state in process_exported_symbols() for each processed
symbol. That looks cleaner than changing state.sym and resetting some
parts of the state as the function walks over the exported symbols.

-- 
Thanks,
Petr


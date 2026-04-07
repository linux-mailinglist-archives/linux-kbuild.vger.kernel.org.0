Return-Path: <linux-kbuild+bounces-12707-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO+mFuDq1GlPywcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12707-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 13:30:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3C3ADB5A
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 13:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 472D63028134
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 11:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5163AE18D;
	Tue,  7 Apr 2026 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LlgejsTs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346C3AE6F2
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Apr 2026 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561414; cv=none; b=UE2Y3I0ZIvUFnAV8tccAkn4txVezZ3onm0vcrWtnJ0WW9jxCGiKVXcxy9QsUEz4xvV+q0E2PydaAPOVmyq1V3yZdckwsbvRVNTslBD+4KdBl5P2b+MPDlBjvzUTp9AvAgH3rkltnancUiIySzFeNMtuXHh/rEueSXTjZ+MnBjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561414; c=relaxed/simple;
	bh=gJmeGJ4YN8tSj2UwwdnqaAqNbb191sdvW00bw/KMDMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImmV/zHFw+j5ooBfFPvLN71mGYsS91hwgwS5dK1VHTUG2rXmbiK+sD3w7o6V6lNhmdZaMBqeQUBwtqT9V+ALu7KPacqGaLCfLQM5aDBWL0iBXTbFQDxj7+3/7W6/E+pdKNtDodFwNq7kb1M0jcK715n12AK1nVRtbRHzJ50pK84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LlgejsTs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfa33a983so2932440f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Apr 2026 04:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775561410; x=1776166210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0AK+dItOezHrfutn/S86jIfwBt1tYlgVzWPhG3Rkg4=;
        b=LlgejsTsH9VJsNm/3X0MBF7h9YHfSL4diYMLtPfjqUh+JpV3M/Y0wPgN7Y1ctIcwv2
         im0KDa4nk/17sDatAoJzu6p6lyobo6xkj48+5xoDwElSUvwwMoKONYjukr2NLxduW5Wb
         +iltYLAfBzgwtTrOGZKBSMJHqcRVW6TDVpQShQTV27EfvapSBIluxWltwNuz9cqcpQ3i
         SsOi/aySKC0/5Xv+pPdLYyf0yh7JNmJdDTJVWMZ2EZoYF4pMyV5IbO02ahzOPrPKqezQ
         2hS3oEhzVOs69yrWQvLr8Ah6apAMl7QV/heiiKU1KlTUYP1v5y6KfAlpDab3lqldAZxd
         ompA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561410; x=1776166210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0AK+dItOezHrfutn/S86jIfwBt1tYlgVzWPhG3Rkg4=;
        b=hch3qz6BzQLFdRS7tF+94/dQWrX9hVadmW/PIxRxGOTep2duBrUdzhOF4l3jK4MZm7
         4/U1ZIZvA2tziFgIrjM4mmOp+ASbcRAMJ5LHkBUJuLGqsNmWl9/rkLEfRKHaTCrAZaNu
         rnN+m6Uq1rKuwzb0tbnGBlVyoaidtqeXUiXCfekyX+2nUA1uUwsfAngVcTkclQyETI7e
         8cLPI2mpUFsHPYhKs/gUBeoa2QN+P9WE7ZosX+PT7i8PWD7MnGiq7Uvj9PYeA7eituHI
         FAZcuEoIf2r0laVO1fosaNDY9ekzal1iEvH3jFojrQ9xanOdNqfDjr7XUYSp/jHVXzv6
         uCBw==
X-Forwarded-Encrypted: i=1; AJvYcCV5zSwZ2A7mJCf4ms5reHN6AajpywtcpoMMUtPz2Z39Z+syOA3VTfUjIcQ600xKxkQxFDnFXfGGvQ9UEyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97TRsWWOShRrhO2YS0qEV+1X/R3Aug3tkx26XqiBN/WEKoYK7
	pVcS87pfloTdYveV72xmJm8vukcZCwfkOJ5ENZpTn3h6mrNzwdajVRtwfP5Z9NJ7QjY=
X-Gm-Gg: AeBDies0HUGQwxWCPZ2EJbMsNLpkkBoyWWehpY05lYIFanAji1FFjgiZ8ezWpjBcTai
	c0YYhQnu46XVTc9L+4okKkCDQmqeI91hkmuXEc+hn84/gjzwwV5WQBCU0ofL/unSvejGMvk2pGK
	FN12CvWtHZ11vaM4O3TqPHASn3Ww3N2JRrj9Z3oVBSsOPpC9K23yRp8VpGQKIqLdKXSO4aPZold
	gZqODzdSBq59Upmb2FzkpyGQ9w2J0DYaPFkeW/wfhQvo9jlrzg5H9F8T9gScpuj2P8xdylONw2O
	bLzmXWmoEeVaiqNaDESY5KjrpFRttSMCTnxuuxWDy+RF/N+2Gs12bFeZu6khDW7ySmT0+9hsl4M
	II3Lh5eHeijjTeNfaEFeAA3EqLthd/5HqIraJQcwZdqMy7KC1UElkLYnquVPEtgVEUGILFzYMFt
	kt/3b9tyaf6Mk4gS7xBqCtV3ijrAPLTQE93a+8iPetcHis
X-Received: by 2002:a5d:5d0f:0:b0:43d:184:8a9b with SMTP id ffacd0b85a97d-43d2929d8fcmr23481469f8f.16.1775561409975;
        Tue, 07 Apr 2026 04:30:09 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm49743604f8f.4.2026.04.07.04.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:30:09 -0700 (PDT)
Message-ID: <dc3db54f-f95d-46aa-ad84-6258abd13fab@suse.com>
Date: Tue, 7 Apr 2026 13:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild/btf: Avoid relinking modules when only vmlinux
 changes
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260402141911.1577711-1-petr.pavlu@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260402141911.1577711-1-petr.pavlu@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,kernel.org,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12707-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: C8B3C3ADB5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 4:17 PM, Petr Pavlu wrote:
> Commit 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled
> and pahole supports it") in 2020 introduced CONFIG_DEBUG_INFO_BTF_MODULES
> to enable generation of split BTF for kernel modules. This change required
> the %.ko Makefile rule to additionally depend on vmlinux, which is used as
> a base for deduplication. The regular ld_ko_o command executed by the rule
> was then modified to be skipped if only vmlinux changes. This was done by
> introducing a new if_changed_except command and updating the original call
> to '+$(call if_changed_except,ld_ko_o,vmlinux)'.
> 
> Later, commit 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some
> in-kernel build artifacts") in 2024 updated the rule's reference to vmlinux
> from 'vmlinux' to '$(objtree)/vmlinux'. This accidentally broke the
> previous logic to skip relinking modules if only vmlinux changes. The issue
> is that '$(objtree)' is typically '.' and GNU Make normalizes the resulting
> prerequisite './vmlinux' to just 'vmlinux', while the exclusion logic
> retains the raw './vmlinux'. As a result, if_changed_except doesn't
> correctly filter out vmlinux. Consequently, with
> CONFIG_DEBUG_INFO_BTF_MODULES=y, modules are relinked even if only vmlinux
> changes.
> 
> Additionally, commit 522397d05e7d ("resolve_btfids: Change in-place update
> with raw binary output") in 2025 reworked the method for patching BTF data
> into the resulting modules by using 'objcopy --add-section'. This command
> fails if a section already exists.
> 
> Fix the unnecessary relinking issue by also excluding the normalized form
> 'vmlinux' when invoking ld_ko_o. Adjust embed_btf_data() to first use the
> --remove-section option to remove the patched BTF section if it is already
> present.

I noticed that sorting id+flags in BTF_SET8 by resolve_btfids doesn't
seem to be idempotent, so this requires additional work.

-- Petr


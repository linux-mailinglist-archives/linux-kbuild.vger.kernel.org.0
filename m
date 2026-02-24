Return-Path: <linux-kbuild+bounces-11411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PZIATDvnWkHSwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11411-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 19:34:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7418B73C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 19:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8F6B30087C6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 18:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34BC3AA1B8;
	Tue, 24 Feb 2026 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2PxMZRMk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56A637F75D
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958049; cv=none; b=ZxrogVF74YUHuHGiMDkWUPfHSwJXAmwUjYAYkMn4UCcfjbMqroAF3Xe03DyKW9AdZrtgwUqNZ9umHKfPzQ+kMD6dvLl7SSre2UIm47MQUJFY3zM/vQmfK3CDFqFzZ45H3SzboL2WubjmCUu7EPBQ4qKqBo0xbiS5cYsRIISAQYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958049; c=relaxed/simple;
	bh=J11iK2XwIj2+zXIcYCQZxiKQs/qMUnRO89klT0AGl1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bMfQl8fI1QEpyV+UP90EDq81Gxpay3c5AQHsuBOTNkzFZJAzngYPQ/iuD6ztEyVgOjQ/5BNM+X4eklpcYn7doIwi7S0E+taqnQHdScGSHXIkkYVoZ4qtriaYMylpagk737ETlrRba7QehW2R9YeeQ2xKGztRL8fFzJ/HpFeVuyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2PxMZRMk; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdbe1bd565so238923eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771958048; x=1772562848; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QrjBvSrm8JFCEhJvVydTf7Q6kCsOJiDnm0ZLRH2yvhY=;
        b=2PxMZRMkvwdPT6xmoQWt26Bz7LxYouErxHbvwHpyCRpyKkAEiMZw8KBiIBg284l0UR
         rtByLaeejleh76tViNccPtvMoMwjDzGLrD8GMB6spm/oT7ULoRjp1sJEIDvccw+AM5f0
         mL5Owi6Pjy/3hz5snmZIlMTcB4gQMBt2Qw3ti9ulThlUP93RHkgKVKk+otIiSlsSaPQU
         /c4AwOHIwI9Ojy63pFWM1uUZTr/9Ytq610yfVjDwuk0RhrulAAvSttVQOXYCPxn776E+
         rGOG3KK/FH14b2fU5OqogoRGcN7f8Lkuq5lIa6icsKjV1Bw+UkgETMBU2Tdilub01cme
         OFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958048; x=1772562848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrjBvSrm8JFCEhJvVydTf7Q6kCsOJiDnm0ZLRH2yvhY=;
        b=dvT+owESOnIqXAvd3uLS8wIP+ys8PnGweTtRGqKK0j/cxfrJcyXXEdgAWaV7329Mdb
         cynWpFSIK0LQLZJdVW3cw5LNgOpEd7yRBSgOYjcxf9QJlVVia93QXaG8j/LjwiMicIJo
         394y9D26zwgIIgLgjotChZED0dkeQMAdDWoaID6f/1gRNh0h33lZ62pEwUrIzTrSI0lO
         Bx6ct56P7Mdf5DPn545Oi3sM10rMMWrSZmQ73Arpg9T0i2/204o0hFCcejsn75eZJjX6
         51InUGYuMW1k/DdtTpE4kRMp5oi0w32mV7OEUvFEcQ9Ify4Juw20oVB7LWhO4Sct3lmC
         TeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNcV81NKeQ/mE2Zeme2CyfBoFWGHz00kdFYrSy8YH9uDwpcojy8c1epObY8ZGIooeG/Sx2tXkKv65yObE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0PujPy41prsI/IY3uPFwMQ0n4k51QQY4VxBFlbkhjiHcjQAA
	1cdW01ANrZByMEhX17ULjCykIIx+Do6bEJvm5C3g0VIWQ3UGjkikX/NmCk6t4HL7hS3b+nOsHfr
	NS+d04Vl4rAYLKR6/VoG0AoQOd8TsHQ==
X-Received: from dycng10.prod.google.com ([2002:a05:7300:ce0a:b0:2ba:963b:54da])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:d718:b0:2ba:6ffe:450 with SMTP id 5a478bee46e88-2bd7bd3aa44mr4531030eec.33.1771958047807;
 Tue, 24 Feb 2026 10:34:07 -0800 (PST)
Date: Tue, 24 Feb 2026 18:34:06 +0000
In-Reply-To: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
X-Mailer: b4 0.14.3
Message-ID: <177195804671.1905199.15508123005606240406.b4-ty@google.com>
Subject: Re: [PATCH] module: Fix kernel panic when a symbol st_shndx is out of bounds
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11411-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,iogearbox.net,linux.dev,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CC7418B73C
X-Rspamd-Action: no action

On Tue, 30 Dec 2025 10:32:08 -0800, Ihor Solodrai wrote:
> The module loader doesn't check for bounds of the ELF section index in
> simplify_symbols():
> 
>        for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
> 		const char *name = info->strtab + sym[i].st_name;
> 
> 		switch (sym[i].st_shndx) {
> 		case SHN_COMMON:
> 
> [...]

Applied to modules-next, thanks!

[1/1] module: Fix kernel panic when a symbol st_shndx is out of bounds
      commit: f9d69d5e7bde2295eb7488a56f094ac8f5383b92

Best regards,

	Sami




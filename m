Return-Path: <linux-kbuild+bounces-13278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGaWNYaFDGoniwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13278-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 17:45:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E5581AB5
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 17:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5B493040EC0
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 15:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9343403FF;
	Tue, 19 May 2026 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A/ecmYfy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FD33ADB2
	for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205456; cv=pass; b=jOA1oYdHxnQVmjaAesX3369/wWje703Yie7zys3jR547WE5GyZDmsSWdUmE55u9McEOqp7/XPv2xI7FjcIk7Zl01wQ4r8ZcyHVqkrPVioBEdj3+nPG/geLJ3dkyhHHV5bN6QKqEcYcFNMC7DtzxzUNhrJ5Sk/4kEX3GosPeJG8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205456; c=relaxed/simple;
	bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxHVoMJvw6sc1jleJEqIwBn/o0ixeR5k4S5QmEMhHqmu4UX0lyuEkJ7LJqXd5ZeC9qLEPzdoa6cefpHkgYsn3zmYsqNrModE7Yz48EPaK3Lm/O8KbWw24BYAttEmnWr/MqqiFiLC5i1VJJI/eZO0iMB1bsaXtpt5d17u6CH+NQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A/ecmYfy; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so213a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 08:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779205452; cv=none;
        d=google.com; s=arc-20240605;
        b=IjnV/3N5XmydANj3rPBbaOvCplPRE8lrchA/HpsfR2aYWt4m5g6gpneyLTl1imLZyD
         c26fl2lgWOB7v07Vyu5iKgqjU4ymxp9ew7zeBj6W9L78zufnxZu7CtY2jPO2zxr3tac1
         66KHLv5ZzzMUI0TWgKFL2afCL6JENUSrHblVd2QGFfVLNq8oOL/rmcgGm1Sa6qfMCbjk
         B36H+ighLKx4BD8kvNyD9UpPF5WmwhnR8puYlUDSPCWLMiq45w+Hrhs7g7q3Lxe6l7fU
         lY22rNAUv3Ln+P1RolkkckSfwKgaXc1JwmQkv0h6pdnY0lO4gaWQAt/RW+gRer4tO2fy
         XhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
        fh=A0GCT5NsSvjv61POtldq5BbrkEifUNM3qfr6NlZT01Q=;
        b=MF9QSYJYwcx3AyCCnB4QEupiH6eE3JteRIhpfNzTdbIavGEl77s/R8o4TvItBOTgvk
         hobUKNdP92iyz7+sP+CVpY9O6SENA0+Tzx8vab5TN3wFomqQu/EiDVxBHraXJsSiCNfU
         D/O88SPvPeklsIfdgnRZudCFIs4LEORgTk1QFNU+Y40S2cf5iHztGKkjyF/NpFlPFL3M
         17P3ckC2FoSeaU/9Hx5gLAxxNoCI/PRmWCaWy2+WuKgDEfP6Ly9MOtw29na5gFMzPux9
         ajFs7inwiDA93/iQ2EQmmWI8oM0uUVLYIGVkCLQS5tmXaGxW9e/iXU8RidX8zjla+LWM
         LwDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779205452; x=1779810252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
        b=A/ecmYfy9951nJ4LCE+u8WArwrI0SCJT1s0iEX2rRA6p6Tak4yKTviq3cewrvHCJvO
         +geUon5fkDXd5+1ABUBkVRJhlQOaf4vKccbF/un+SGZS8nDN13BdxCPh7/bEIw+p2IQB
         NFgSCiwcAS4zO/7jtOwe9SOgH9pHhjSsAdU2yafPalKRQV/qCUd5QoiPZMQfeCCsJC54
         ql6PTCYhD+6/BFP1jo+ngx3LMhDZ0IrIZOOmfMIPcob9f0li0GorDGxwKwWyuxg2G2sd
         lQjLZdGNKrw6sc1R8x6S3BFwup+j02vw5d57Dw8ZOk5RFjy723zanG2T4C+1Z4ruMhIH
         6B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205452; x=1779810252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
        b=dr+gwCRFoLTZzj0sDzkayT6DLbkWB9178VNgOrs5TfGYhZL6VUBCgmjHr8h8YJ0ls8
         V/BmfjZgEbfpYlu7SdSzexit11waQmP1Ytz1uGVpnQMAf7gNZLlB3hfPRkfp8NfVWotY
         qzz/UwMHdnEQBnoopa5LxaNCIVRIEBm8bNA1IiwuU0ck/pb3sgCP+fMmfsVktPpKhniW
         AauylBpZ/xXcpVAIAx2cgU5+s6nDXRKDIQ+poZreySed1sVESVGzO7hxeOZqov0oCJnl
         272oiLaQEjcPPsMKfppQPHGmnJa2//BjyCB9edZVgXxC6VGq6mXaLuFCRzWxVTVov4a8
         qdww==
X-Forwarded-Encrypted: i=1; AFNElJ/V+4WvhnTcLm7a42dqJLLnGKIeoKYceT7urEkmkAhMrzGS+8E3So8o0PY9PgU7BaXlNw0SWDnPKIf7R6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLJhIL8o7ZhBVbZuqYYujILBdJhTq9JjkPdfXneHUtTXIR0u9
	CCOuIUpyY9467Xmsu06nCELMHm8zwojcEpTqZchScngjneYiF2fiS/oUuc0DZq3NzBSHRJXxoOW
	b941U+N9t9Jp1+BIMSWwl3q/7X50xQhSeRCo/A9ks
X-Gm-Gg: Acq92OG83UX748q/1uwDqV8f9EgI+PW+BxLqOg7v4LL0w8t7Eg11su9Caqj2U+jY5GD
	+tCXxYzcnFLl3zcrHta90bJ3KtFNnNQ1u/61pa8Phaa1sinQIjpGr+Z0bVEtjM9y/nQfACQA+Xh
	Qk2eRNSnl8OhNsm+HjoC3u9QEiu04lI8JTIGUlQ7DDoi6fPzVmwJlbhPluFJNYeyTEbcN/x6zmd
	ByH0ZQxT1/unfUDX/2x2M8X/1vajeljyfqVlUpd2m20yKswvVkRgk3m5/o/FO63hXsntT+OTBk5
	HIM3GKd2uxseiR8=
X-Received: by 2002:a05:6402:a61c:b0:67c:f3b6:5fef with SMTP id
 4fb4d7f45d1cf-6848a743865mr146633a12.6.1779205452000; Tue, 19 May 2026
 08:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-5-b3b8cda46bdd@kernel.org>
 <6e555229-ae10-4304-ac1c-3cb02278f77f@app.fastmail.com> <20260518213657.GC3979157@ax162>
In-Reply-To: <20260518213657.GC3979157@ax162>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 19 May 2026 08:43:35 -0700
X-Gm-Features: AVHnY4KFxq9Y9fyt4Zirp8pvmZcwOWCsd7vtNHL-BTOTWFFqbw875HXs0rig4XU
Message-ID: <CABCJKufEZt=PiP2StbFMatB_G8XM4=q_rF5e-ewsqDjizd2TSw@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] arch/Kconfig: Remove tautological conditions
 from HAS_LTO_CLANG
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13278-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,google.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 815E5581AB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 2:39=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, May 18, 2026 at 09:56:20AM +0200, Arnd Bergmann wrote:
> > Semi-related to this: we discussed a few years ago that we may one
> > day no longer need both full-lto and thin-lto.
> >
> > Is there still a need to keep supporting full-lto with clang-17+,
> > or can we expect everyone to use the thin version thee days?
>
> I believe there are still folks using full LTO, as I think that there is
> still some performance to be gained from using full LTO over thin LTO,
> but I am not sure.

Yes, AFAIK the performance with full LTO is still noticeably better
than with ThinLTO.

Sami


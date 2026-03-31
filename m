Return-Path: <linux-kbuild+bounces-12373-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OnDCKrQSy2nsDgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12373-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:17:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AF36299D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2018300FEDC
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 00:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B64819CD19;
	Tue, 31 Mar 2026 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sdfycjZm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608815C14F
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774916274; cv=pass; b=iV/6a+uctB3pD/+Jp1vUwbr2ILt3KHmSoqC2UrklnnsooRUlS011EujXFFoLavgc+pFNNr77a4aeskOrqS77jnY5GPm9ugl1sjG1G9vuR7T3nMMyXQfKLtsW8/S3q35U6M402LYccTWW6CVDRYfhS9Uda/T62LVS2WRmjbwJkhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774916274; c=relaxed/simple;
	bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFvbh+5O+AhqjEPADMV1ByRxw6ri4vFkrXbdcDbOxG3iyKHStYQHkociTrWT2SJdxe4u/NnkRU41HkQDYU0A9g1InFAeVxN5S9XHG7KIpBG3R5o1my2tMAaowROsZW+eOJg0qvtHnUE/fDgguW+n8PEm4FG0cnb3o3J0cfVQKHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sdfycjZm; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56cf45deb45so3833455e0c.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 17:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774916272; cv=none;
        d=google.com; s=arc-20240605;
        b=DeemCukllm0IsQJsO+BZ1+XBClAMwgqmhVv2taaRUGmvHIUNrHNJHv6p8IRL1xKADq
         YE/UmfjVZCmyFpff8dWxTy+kt5jygknoWGQICmI7+iaiX51U+t1XAoBIAXlBV2FfInn2
         djNjR0jkbRfSCjif4LHjh+cNCKwxVo+TZZTYR+GQt8rSNzqRlMWRG4VCXTeFypovDyKQ
         PMyTbUjPHuSNArBFeDETKeKQv5BPpsyvmfqpTLZy8uXEuSjeV/8E5NxjVjIetVlQJ04L
         HkE1PCVrchsMYpFTpW9BOlUdZBqmSahehZwi5dswP2RLaoWnisSNabITYVeDsDQBzd9P
         J0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
        fh=OYqpIHIwl3HNS4/qeBq12KKmiJWkQkbxPGsZuMuVQgY=;
        b=QBIR0z1MXM3PH4lhVF/cr/RHnIWXPwdyj5VNDxZD5K9g+RFgSuOM56LddXjcAP6hwf
         PTr8MQ2Z18n58mTvyW59h8ousLLwRhorPt7/I/lu7eGOtc7NJ7emRp9w+WX026qLtr3i
         3SGlcNOG8EhtkomkH7Rqdl85bu7yLxFs0GD74X/YW8GpUdMOe7Cg6mr0MyMbMVCtnX96
         xG5J5MpJqDDhr6ylYow6Ub7IkZWlbzaN9XLU2WYFl8RgXdt3ckt+yBEX3qk47pKSuFek
         x0x0X7h3/nYMWY+OMu59uug+U4ZRE8ou5nWi+GAxJ8T1oAxSt8UEslvO2N6c38mEQN4B
         bwyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774916272; x=1775521072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
        b=sdfycjZmq5SpSoSgo9zMzeS6RA+u9rqVE0wFOTVCfakew9Xk/k7qqmh+YEluowm+L6
         tARsdd2PmPDVnRkNT+jbvaIjxl+yB5KUwl+sCqxJ7W1sZnCpugw8if/Ft23bvNHoER6F
         rSW0W9cZozXGaD8hTQRKGw4GLLHKmlD8TI4tRcJryh6rg3+5sjw8XluG8qC0J4jdZcsU
         eD9Mzj5FLY+YxHmuvlEVCwWN6IqicsG8vAhTBj+VmZu0I0zL+xRNGx25U5Cr0zpBM2UR
         ECs1BiLlI1pSF84zRGLyij9cikKRRr9cKNOjtxMQNjUSPpBB1Ihc+IA0VEQAxhHjI+4b
         jCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774916272; x=1775521072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0+3yt8ogyNgCzzLsaG2fLhsr37EqQgBrSZLNfws7pk=;
        b=DmVATsG19YF3DsEjHA+pjMT4wYUpLCFgT6/MLy90HIEWlz4/mM/vooy0x6LhCKFzF8
         WUx9oW5gmLf+WQay28X6EHauIDMzbvXdv/IqWe0CcdcznJ82WV+OHkvpZ4jk040cKne+
         x/7rOOCYcFG2sysUUKu6uGdecmGVJcnyxsY/m/PJzLjBv64HLSnT6HdeuSMBDdSfql9N
         XodEDluxNOk2dc/QHat47GLGPLICCUyveEubs6v0RkfNDBGXcmUGij2f1tnd5NTTm6AP
         1EBL3ABIi5DOGuhcQsorLPIwa9xZW+NyeKB80kEgSjcoS9XoUMIUm3d6EjlrQ/QtmTCh
         7GgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpA3KFYAmC8pkA6qEh/Em1UKMino7fsryxj15yN7XRTvuT/R00BHTHlaDSCApaneXtJjph9jQUWdnKagA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh6pKVEe+FEALaZsfMrQnnSfyd9YZyFEJZDMbDmD0qO5G3hU5X
	oCdC+Nv8cAmpKMuZmmvWrtanyHlFEv0Q37kZGaZ6qbbePzjZEyAJknEgbNcDnEdT/IPZWbu/0yS
	3tJhpE4lXt5radBufvL0jMLY9LdMwOW5bbNDCx9Ra
X-Gm-Gg: ATEYQzxGJ+WhckmCH7CaTxUIzjUavTM28zvAlYAW2kl0xNXM1oDVf1iBApMkso+DcX/
	afu2yb1EVUarQXsOYTQ2/vWJ2eT8amhviMvAtdEdG6kXwGUEvOZMxE0VJZh6GLb74gQxPYeIkl3
	c/41UvFW4lxls/9gAxR+PCKgVZmtxny8GRKtsTZxbZ3ie+BM8TeBIapOkKv0GNx/ePFuvC+/T9j
	qZCL1/KKbXtiwqbCjUsG5dR61GOC/sbavDr3AIEBK1lR/CsdU85SZo8RmQcXE7axJhuxP9e7Fpu
	zM/brrY=
X-Received: by 2002:a05:6122:4698:b0:56a:ef51:4cae with SMTP id
 71dfb90a1353d-56d4a4cab86mr6574629e0c.4.1774916271243; Mon, 30 Mar 2026
 17:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
 <20260327221837.GA3622500@ax162> <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
 <202603292059.01A4CB14F2@keescook> <20260330053604.GA879042@ax162> <202603301156.19EEEBE@keescook>
In-Reply-To: <202603301156.19EEEBE@keescook>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 30 Mar 2026 17:17:37 -0700
X-Gm-Features: AQROBzDfJ75j20Pt0fiuvNJg-VsI_kuMnBSed2bUkXNP6__lPP5g9i7kLDwy34I
Message-ID: <CAFhGd8qUoYnpfMcaUy8=Xde1hkch50MD6WMSsmc7BJqNXz1FyQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for FORTIFY_SOURCE
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12373-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 062AF36299D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, Mar 30, 2026 at 11:56=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Mar 30, 2026 at 07:36:04AM +0200, Nathan Chancellor wrote:
> > On Sun, Mar 29, 2026 at 08:59:51PM -0700, Kees Cook wrote:
> > > On Fri, Mar 27, 2026 at 03:29:18PM -0700, Justin Stitt wrote:
> > > > On Fri, Mar 27, 2026 at 3:18=E2=80=AFPM Nathan Chancellor <nathan@k=
ernel.org> wrote:
> > > > The compile time impact is not measurable (within expected noise). =
The
> > > > peak memory usage may increase by somewhere in the 0.5% to 1.5% ran=
ge
> > > > depending on build configuration.
> > > >
> > > > I bundled this under fortify to limit initial impact as its had
> > > > virtually no real-world testing and may produce unhelpful diagnosti=
c
> > > > notes under its heuristic mode. I don't expect folks to use `-g1` i=
n
> > > > the kernel (which would enable full-proof diagnostic notes).
> > > >
> > > > > If not, maybe worth adding a Kconfig option that is force selecte=
d by FORTIFY_SOURCE with
> > > > > clang or can be optionally enabled by a user?
> > > >
> > > > I'll defer to you on this one. We could add
> > > > CONFIG_SHOW_INLINING_CHAIN_NOTES or something similar?
> > >
> > > I would prefer to just unconditionally enable this when it is support=
ed.
> >
> > Agreed. It cannot possibly be worse than the status quo, right? :) This
> > feels very similar to -fdiagnostics-show-context=3D2, so maybe add it n=
ear
> > there?
>
> Yeah, similar. That'd be a good place for it. :)

Thanks both of you for the suggestion:

Here's [v2] :)

>
> --
> Kees Cook

[v2]: https://lore.kernel.org/all/20260330-kbuild-show-inlining-v2-1-c0c481=
a4ea7b@google.com/

Justin


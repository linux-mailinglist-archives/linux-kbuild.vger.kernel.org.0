Return-Path: <linux-kbuild+bounces-11895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIyEJv78smmQRQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11895-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 18:50:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85773276D08
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 18:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCA79303AAB4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 17:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F323FE654;
	Thu, 12 Mar 2026 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L5as42PH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5993F7E88
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337841; cv=pass; b=oh6EJIwYxn5OUkW6hs5CX/EVWrEpDpAiD/VIhkd+JjqyAyx6FPH4AGMc3UToC8+3W5b6yYssxQH2QAPTr1x8G1sa8ztnOj9qFR4yPAbE7Kw2uFU3G4kfoHnDk/Tc4APcrlvVzCb3Qm1gF/DuJp73eez2KGLc9g5lvUS0KRK3cqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337841; c=relaxed/simple;
	bh=x6kgdD93fKurL4koxKbMcGJDp9CJO+5zYkbp7D++8lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IplknwQq7vjthnu0AJ4EvZ5GK2uAv4AcTmo8X65FBSjY0gngv4YMRCVSkoSseWQ47pKNNqyA+uc00IqSUfFS4qtQlBdscANXlNKeILPJqLyab8exbfEObyA5fFraaAKDfTa6u6LxcQDpxkC4/aTumICflm+SrMrgfqjQt67TLL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L5as42PH; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-509062d829dso43691cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 10:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773337838; cv=none;
        d=google.com; s=arc-20240605;
        b=KuaTS3PFSB5Z76pxWdmh7ymPSIsyLER0CecIJ+t+X9gHcj+pzX6fyainlj00PmENs2
         O+MENUGHZEY4pCvVaJ5ERYP7VJHbUBVMpSk6OPWEZkaZTr6h7RNc85pA7sgwN86cR7in
         hr2Fc9faAsfR6+wOEYINZXKbMGNaU1nSEHm3Awy5vD3eQAfhJ8xTBp/+/7aIv6OvILJZ
         wIjKv3Pw7ZOtLLjbDR0IXJfDlTX/ZiJd9lg1Edl6i5QdLLHdFg9ykc86euPqcObVdLTD
         larssYwpxWEl+695YMXOYcPhQzjDszqWlRgNfjjKrBe3DzC6gB41mC0gde+FQXI/pl9B
         KgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=riDQaNuNe85Wp65XhJ0B6gmgQZh+tG/0ah/0LfZv0x4=;
        fh=8cbnL2djohEF4lNIBqCVgmswM0isRbmAYToZBCnroA8=;
        b=KLVj8wPJfGq+3ii6+QZi/RVOWaqgaReQ0sAHQysm9I5hz/Lx7EdBuvL3KHog7ELL8p
         EgoxZe0gEwZzzbskJw0aT3zseUdhpvjOlNtvqNlfImWZS9z/eC71Nqk5AiSJH8nveIgg
         mAsZw+ElBd2AQarpnGzSHJ1riXzW8ZGUeSVZT1O9cBhz5H0L1zW+PE1L9cwJqEhAprjP
         a8p8AV9bh4i6MIdj+TOl2uHTQaopByEMbka0bvlOPW1VafjSkXXU7007rSeX06me3WAu
         IvPTOIUexAeNpnxKrrZHgjLwYh4DTHyiWCam5ul1mNXx8OLJ685P40j+61n2JFhxHyIO
         7wTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773337838; x=1773942638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riDQaNuNe85Wp65XhJ0B6gmgQZh+tG/0ah/0LfZv0x4=;
        b=L5as42PHpRLRZL1X+xkBDqsxRxWD/bW9pvvwCoVvlSKANzQQrbZOIIA0RUKfrtYFpi
         jKWIWKgl+E6RuTTo8ywVIAkhK88HhpVesr1g+TXBeLx8sTlQaaQjckV4toolKcuPV6F7
         DVOLJcUUjQx8VTX6B5WFEMS/xOqyT0MUegczUAfeKV0UWfqdzJ40z842qCp6FiN7Phc8
         VZCbpTZHdiaxhvRytQf6H8SKveKz1bTPSaweAcI8Ffx3ZCSsqR1qgeTa2PRstjKE/ONi
         rJVSuobOx6Zf2dGMjfHzIeTKoOzFlcCuv7b1Q3yq3e+RduA2iEFvtnTra/ootoHt1NHt
         9jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773337838; x=1773942638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=riDQaNuNe85Wp65XhJ0B6gmgQZh+tG/0ah/0LfZv0x4=;
        b=ZW3b0NgRFdQSq/nhJnzyC0HpQwJ79+T8GTNgkFKZ3mi2Hut4JYB14ArMN7RsLurIcG
         wBoCRoLygT83vn5x0bSpHymmHOu1JMDa53DKLhoT066NHnKs/h6KIh2IZcPgIIA2xPPq
         4mcP7F9yhk6DzMSDI47fCHcb5bCd3TE576ZmH+KlRfyMTb/jDAqg5Z0n2cuFxC0wC2qI
         L6stps5EDuuB4pugaEYcautlOGe5a/c1aqhzmPOrLfCTfsUcadpbO960i3aHW8Yam6xh
         E12b4z/t30MVXb4eJOj/db8VoRxipU5XrZQUgHqqwY02hnUPaGfuBohxSTJI79RdiChN
         XIww==
X-Forwarded-Encrypted: i=1; AJvYcCW95MRP8reZ+WcDLJZHaqUiWJpBWGIEz2+9iIR3B1rz/Q+15qw9v683JM1IxLtTUcue6ytZ1xIh9Xj+W3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXYAZFR/ZYCqDng5EFXsHSnXGndVx7pQS31AlnuajxhQgmvW/N
	jpbfHc/hbm3J+OjrrGbatZaqLnxUvpFKuTZey/ODwAs1Hxvh2WwZH0V26isFxoeyXzHKtI2IwOt
	F3Q65pbgaJVNCUYawFVIe0g61+lDmxQFtoQ07iQd7
X-Gm-Gg: ATEYQzyE+yNtPWBxmPcdcODtb3wgU2G184ZLCLXpfToSKesES1QzbZvqDKgENjuoJvg
	TadDXZqKtXq6CByJjMrEol0/apCfs8tICPIgqk7K6whR6oHeQeFTvggjEnRwuzFOJfFDdPDxMnN
	2D0EpBK0DGChuQXceBPbjdbd927e4Sdh077nUO97xdoh6MbGXtWYAlF8ONGHp1UlY0N6sgAla8g
	sSn/oykSByPk4Ft8Cx2CEOBTZvfivbOXKobOlKZmBVlScTgZxEvczphbKO7i/i91CDzayE0kM8g
	+qk2GmS5uY08ZMmtjJKaTt+BBSaNmy8EptMShuhtMEVY8MU=
X-Received: by 2002:ac8:5f8d:0:b0:507:35b2:6b9 with SMTP id
 d75a77b69052e-5095857222dmr700391cf.7.1773337837279; Thu, 12 Mar 2026
 10:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20260312082502.GA790897@ax162>
 <abKnZrHleb-XKR_a@derry.ads.avm.de>
In-Reply-To: <abKnZrHleb-XKR_a@derry.ads.avm.de>
From: Rong Xu <xur@google.com>
Date: Thu, 12 Mar 2026 10:50:25 -0700
X-Gm-Features: AaiRm50m3O3vpQMoqcp7iYaekhPo8jFsDHb5Z6MBCqVpGsCpHDXItc8Q-p5d2MA
Message-ID: <CAF1bQ=Sbo32njHxr3C05p_n3MH0wtdm3OE_XmpcX=PadGEDu4A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang ThinLTO
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11895-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 85773276D08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I appreciate Nathan and Nicolas taking this on. Should there be
anything required from my side, please let me know.

-Rong

On Thu, Mar 12, 2026 at 4:46=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Thu, Mar 12, 2026 at 01:25:02AM -0700, Nathan Chancellor wrote:
> > Hi Nicolas,
> >
> > On Tue, Oct 28, 2025 at 06:28:20PM +0000, xur@google.com wrote:
> > > From: Rong Xu <xur@google.com>
> > >
> > > ChangeLog:
> > >
> > > V5: Handle single quote escaping in echo _c_flags to fix
> > >     Piotr Gorski's reported error.
> > >
> > > V4: This is based on the reimplementation provided by Masahiro Yamada
> > > on May 26. The difference is that this version now saves the compiler
> > > flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> > > for the subsequent Back-End (BE) compilation.
> > >
> > > Rong Xu (2):
> > >   kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
> > >   kbuild: distributed build support for Clang ThinLTO
> > >
> > >  .gitignore                 |  2 +
> > >  Makefile                   | 25 +++++-------
> > >  arch/Kconfig               | 19 +++++++++
> > >  scripts/Makefile.lib       |  7 ++++
> > >  scripts/Makefile.thinlto   | 40 ++++++++++++++++++
> > >  scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++=
++
> > >  scripts/mod/modpost.c      | 15 +++++--
> > >  7 files changed, 174 insertions(+), 17 deletions(-)
> > >  create mode 100644 scripts/Makefile.thinlto
> > >  create mode 100644 scripts/Makefile.vmlinux_a
> >
> > I have been running this for a few months locally and I have not notice=
d
> > any problems with it (at least for the two distribution configurations =
I
> > regularly test). I think this looks good overall and seems fairly well
> > contained thanks to Masahiro's work on the earlier revisions. Could thi=
s
> > be picked up in kbuild-next-unstable so it can bake in -next for a
> > little bit? It should still be applicable.
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks!  Sure, I will pick the series up.
>
> Kind regards,
> Nicolas


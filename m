Return-Path: <linux-kbuild+bounces-11024-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLgNMq0Ag2keggMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11024-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:17:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E0E306B
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AFEC301A722
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 08:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA4736AB66;
	Wed,  4 Feb 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+SLYfpf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F28369984
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193031; cv=none; b=n5a1BsdEFmpXnrLAfw7na9WyJY6UaDhjjSiOphLcKYBjytNXbZZVAV61cNV6CpsyYtJtzO25e/PZBr7jSv1Ru+ceT4fZPBZk0OkEL+DuFofbDuNWRMUC1h+9k4yLd0cqsg6cZkwK9iwx9hEaA/JCG+5DSApPVrjL3fAeScpvcUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193031; c=relaxed/simple;
	bh=rv1tGxmLaUOeZ2if0KfPwe+zfG5K3Lyl+m8DWDvHB9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/jh+0B2QJ69Pxx65/qp5vGPNbeldWe6vE5OYqinS2eoHUjIk0Z31OcR4hDz5LODdhWq+BYxhFlk7htL64D66H8qAPthfk0mTzwxBVwA05OHp9ucSJeHNVSLbxBe+bRwRsTE8Y+7LFc/WCS1WAv4RFvD2BOLRyLJE4mTnCzhHzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+SLYfpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146C7C19422
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770193031;
	bh=rv1tGxmLaUOeZ2if0KfPwe+zfG5K3Lyl+m8DWDvHB9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G+SLYfpfEHc3josox5N3xRMQ45OzK5Zo1oZWE//2n7LrP8sg54ownKq/VvSdcdEG6
	 +o6VjmHBUTj6uOam9LDn8FWim3aM6nZKTxAUMgUNdZuXcA6q1UB5BOyrsv0wc2Gx5G
	 0scoEJlsKy05aM4sWjDUwdrSqY3HhDXgj+aqH7NmwcGJSUxW0wCSZju0962+dKeoO0
	 Bq7Vov4tj/E3H+MXSHSrHrI+4m0tgmv0B3zNfjdL5+H/NsioCNhX1KjJPCgFkd+Ybj
	 oIF+A/nb3wtKU4Lx2YbnFPWhRPdeleFVKPMKBMtdsNVkYu37f40lFQZKlaaE34dWGr
	 LsZboplB2QwEw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-385e7cafef9so54270701fa.0
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Feb 2026 00:17:10 -0800 (PST)
X-Gm-Message-State: AOJu0YxlewyxfuMvrJ769T8Xr8s5O9i1nwacFi1G92e4J3puHhzQmB7k
	vcVvys+fCyDQP5pxY8EioSoFXM5QiIQ5skRBudqSKTxUQCnpySiSC2gA3YVSH2TO6zxEi/xAaNF
	ZU8Qz+TOCteAF2666sTsmaJS3HCopCGE=
X-Received: by 2002:a05:651c:2115:b0:383:18fb:fdf5 with SMTP id
 38308e7fff4ca-38691dfd132mr9470871fa.34.1770193029727; Wed, 04 Feb 2026
 00:17:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121105801.1827-1-msuchanek@suse.de> <176973225791.178709.17831414346066426792.b4-ty@kernel.org>
 <CAK7LNARWymjMAZZSiAcduUCB_jk7K3qPtQ7okabp6ajwT2yz-g@mail.gmail.com> <20260204074557.GB1632007@ax162>
In-Reply-To: <20260204074557.GB1632007@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Feb 2026 17:16:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi74v2tc+iddm0WwTD-3HcJQujY=KV1TJV95in=Hkr6w@mail.gmail.com>
X-Gm-Features: AZwV_QjX4YvBrl8eazjR0moEEgH0aeKF7sZzSLus_TwH5VlQpS3Xxo5cfiTmHdg
Message-ID: <CAK7LNARi74v2tc+iddm0WwTD-3HcJQujY=KV1TJV95in=Hkr6w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: dummy-tools: Add python3
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>, 
	Nicolas Schier <nsc@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11024-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[masahiroy@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 395E0E306B
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 4:46=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Wed, Feb 04, 2026 at 04:10:24PM +0900, Masahiro Yamada wrote:
> > On Fri, Jan 30, 2026 at 9:17=E2=80=AFAM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > >
> > > On Wed, 21 Jan 2026 11:57:57 +0100, Michal Suchanek wrote:
> > > > DRM_MSM_VALIDATE_XML depends on a python feature. Add a dummy pytho=
n
> > > > interpreter to make it possible to configure this option with dummy
> > > > tools.
> > > >
> > > >
> > >
> > > Applied to
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kb=
uild-next
> > >
> > > Thanks!
> > >
> > > [1/1] kbuild: dummy-tools: Add python3
> > >       https://git.kernel.org/kbuild/c/76c73cfde7988
> > >
> > > Please look out for regression or issue reports or other follow up
> > > comments, as they may result in the patch/series getting dropped or
> > > reverted. Patches applied to an "unstable" branch are accepted pendin=
g
> > > wider testing in -next and any post-commit review; they will generall=
y
> > > be moved to the main branch in a week if no issues are found.
> > >
> > > Best regards,
> > > --
> > > Nathan Chancellor <nathan@kernel.org>
> >
> >
> > This was unneeded because we can pass PYTHON3=3Dtrue
> > from the command line?
>
> Hmmm yeah, I guess that is a fair point, I had not considered that
> alternative. I had figured that some folks may add scripts/dummy-tools
> to PATH like
>
>   $ PATH=3D$PWD/scripts/dummy-tools:$PATH make ...
>
> to have all relevant tools be used automatically from their default
> values than having to specify

Yeah, this seems to be a valid motivation for this patch.
Thanks.

>   $ make CROSS_COMPILE=3Dscripts/dummy-tools/ PAHOLE=3Dscripts/dummy-tool=
s/pahole PYTHON3=3Dtrue
>
> or whatever (at least, that is probably what I would do if I was using
> this).
>
> Cheers,
> Nathan



--=20
Best Regards
Masahiro Yamada


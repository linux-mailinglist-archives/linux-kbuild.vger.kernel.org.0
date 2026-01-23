Return-Path: <linux-kbuild+bounces-10849-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIqPNzL8c2mf0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10849-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 23:54:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FE37B49C
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 23:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACEC13004F18
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 22:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C62C2DAFA1;
	Fri, 23 Jan 2026 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDgi6M28"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD92DCF58
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208880; cv=none; b=BP//033e9K5s5z9HmcUgSMcz/iJRXCfYV+gp+K1hCbt1rXIhGyhLAZ++qLLk7gySnHLr6FWK3UpkgP+qkU3NeWIiJr6VjWqbjZ9kJ9XzJ6jdWp9g9bf6pmXid6q1ej9dXHhh8Fif4pfHZQnW281px36W5owbf4dY1CL7rTv4fFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208880; c=relaxed/simple;
	bh=Ot6WIFUPwelceTR2NiVNHf8KL8+LzFQb49qk+fiItaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqoktZJTgVn1jYOJVSOfsRoViDrD9xogFtYykYkqAkiRNwCp1zLw7lxUScfARsKRPt3wmaZ8JCCuIG5tFosifjNTZGBflY33QxaZ6WsfggNviU7x+/BfYHVeDLeObyUd44qRzvVH6VtpBg+3DgSFE12+JFMqOId07kTeZ949sC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDgi6M28; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE357C19423
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769208879;
	bh=Ot6WIFUPwelceTR2NiVNHf8KL8+LzFQb49qk+fiItaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vDgi6M28XVhRgn53Dll3CBwW4r8eNyP3yXuuy/gzaK2VCv6G1WTFrghkFQl95VqXl
	 /y2mH2UTxphMfxGIYZ1cPCAkAooLWe2N5fK22pSbWZohNMrP5u0bCD0uQ4qcTXz5jo
	 lDVFVwR+Jw843ZBKOMQQkDpjcBAN/PCuRAYJehHM80GaG0qm5Wko80swtPJNEGkZIM
	 nf2Grz7umKSJNbakmagMPtHTYH+jJqoTSeL5rTPDrSYrmhN3ofXqnDKvn7nLnotdoF
	 me052xz7K05Cjz7uKRtOzKYMsmIjL+5pa+D1B3+5GbBb3FLPbR4zL+ltv+TY/QI3G5
	 lO0ASCyyU0zuQ==
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50145d27b4cso30029421cf.2
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 14:54:39 -0800 (PST)
X-Gm-Message-State: AOJu0YwmOV+H4qXVVguUys5rO0iviVwkRbMtxz24G1rbaLD0AZ+jK12F
	wuMEnLD6gY2izioSepXS3ooVqzAapFLH+2GbwtKR4UukM2DStQQ500bpS0fT0+QiHvu19nHVgun
	XyiRnkrwwZzrr3+mOPpLs7vcEcUi7+bs=
X-Received: by 2002:ac8:5913:0:b0:501:48e9:68f with SMTP id
 d75a77b69052e-502fe61e1a9mr38326881cf.62.1769208878889; Fri, 23 Jan 2026
 14:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
 <20260123205359.GA95167@ax162>
In-Reply-To: <20260123205359.GA95167@ax162>
From: Song Liu <song@kernel.org>
Date: Fri, 23 Jan 2026 14:54:27 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
X-Gm-Features: AZwV_QjHRNTYNQVzDIM1bbv5ItcCG5QeJVxgc1lDFsCECw-7moX9BYTlz6AdztY
Message-ID: <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
Subject: Re: make olddefconfig surprises
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-10849-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,merge_config.sh:url]
X-Rspamd-Queue-Id: 80FE37B49C
X-Rspamd-Action: no action

Hi Nathan,

Thanks for your kind reply!

On Fri, Jan 23, 2026 at 12:54=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
[...]
> > This is confusing to users. For example, selftests users often have
> > a config file in "tools/testing/selftests/*/config" showing which confi=
gs are
> > needed for the tests to pass. The expectation is: default config with t=
hese
> > changes will work. However, this is actually not the case. Many of thes=
e
> > config files actually have "CONFIG_DEVTMPFS=3Dy" to make it work.
>
> I am a little confused by this and how it relates to olddefconfig? Is
> this not just a problem with the config file in the selftests not having
> every configuration that is needed if it expects CONFIG_DEVTMPFS=3Dy but
> does not have it listed? Or am I missing something else here? How are
> those config files in selftests expected to be used? Are they merged
> into existing configuration files with scripts/kconfig/merge_config.sh
> or are they used as a .config then have olddefconfig run on them?

I think in many cases, we use selftests/xx/config as the base .config
and run olddefconfig on it. This is how I got confused in the first
place.

I guess the right way to achieve the this goal is:
    make defconfig
    ./scripts/kconfig/merge_config.sh .config selftests/xxx/config

Actually, from my simple tests, this is the same as
    make defconfig
    cat  selftests/xxx/config >> .config
    make olddefconfig

It appears merge_config.sh and olddefconfig cannot figure out
dependencies, so we need to do it manually. For example, if I
want CONFIG_LIVEPATCH=3Dy, I also need to include all the
dependencies in selftests/xxx/config:

    CONFIG_FUNCTION_TRACER=3Dy
    CONFIG_DYNAMIC_FTRACE=3Dy
    CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
    CONFIG_LIVEPATCH=3Dy

I haven't figured out a way to include all the dependencies
automatically. Did I miss something?

> > So, the question is, shall we change the behavior of olddefconfig so
> > that it still honors defaults in x86_64_defconfig?
>
> Perhaps this could be clarified somehow in 'make help' or elsewhere in
> the Kconfig documentation but this could be a misunderstanding of the
> point of olddefconfig. It is just meant to transition an old/existing
> configuration file to the current tree noninteractively. It won't
> manipulate a configuration beyond that and I am not sure that it should,
> especially since it gets a little confusing around what other
> configuration files should be taken into account when changing values.

I think we shouldn't change the behavior of olddefconfig. It has a very
valid use case.

Thanks,
Song


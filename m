Return-Path: <linux-kbuild+bounces-11019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCRSDRXxgmmWfQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11019-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:11:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AEE28BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E516F30209D1
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 07:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D965366802;
	Wed,  4 Feb 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFKtgBnE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE3635A943
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189062; cv=none; b=NsFOqo0Q+QQ7AFCCdTS5M8xp7RL0UQz9d6TopjCqjnaLEOoW76N4yRcBkEb0E90AOkaQktshQvmcbla3ZHfDXdy5+JzF9wb4lzJSnpahOoe+FMwJH0KaG/5O+Dz+B8U23Bu57pWnRQ9UCahpriP4DGVOMxZlzwEpCchHQmJva10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189062; c=relaxed/simple;
	bh=vJrUdLQVSlvQMFsXoKNmH/ne8IJzlnDsmnYkmwh28dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTehRnxbxEJG55Gt7MLLJ/jFHZjA5WvuF/mmSl28sVjlNRUEK6Uue1joFrTdb2PrZHfyC/rEhkFPr3egvkhYNgzAhO+55H6Vlm9BXBf/Cvl4iMbHhqhE+d67poGpZF5xvna/VVtLWr9aJg3YqOUTG1/NSsSNdBoqfvptydluHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFKtgBnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5961C2BC86
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 07:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770189061;
	bh=vJrUdLQVSlvQMFsXoKNmH/ne8IJzlnDsmnYkmwh28dA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KFKtgBnEDVuRuzUaby6/u0exkzJzplv3cHd7GRXHjPQRsvoXlze5sEyNWo8lYEWa4
	 2Uh4VUTQTO4LdjzEABDPdG7pM3Hf06XAbLiSSivMswXs7JfIgjtnC4qqID6tMdYvt0
	 dx2e+batkbwNulBZ/X3mW4GYeILH4AAV1GI9/WiYSnJwhF/qKuX1zpWOQWCVuSBPML
	 sUCmGZo7Xxfkeu+KN9s4azTah054kYCK0Yx7d+/2CB1drr2CDh5fCliD+JhkLV8Pvh
	 tQe8/E8GYmTeVnUN5AW+2s25G7Iv7FOQS/A23XCkkSFFwRk/x6+MnZv2g1IsneYqLG
	 YIesozprz6WCA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38319cbc8fbso57734581fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 23:11:01 -0800 (PST)
X-Gm-Message-State: AOJu0YxvhvgJ1URqK3JKT0T76gNpHRTLy6ENZCLpJuuM4kt5ls7qxVoI
	Izi+tqst8HUB64M2DpMph5iJ+SGI5bqp2dsH8cNhvoZfe0ZANDvHl8hFeJY8UDourCf8f0yg841
	WAGbD96FMWH3Ua5sfR+dN5t1v3Ma6hSg=
X-Received: by 2002:a05:6512:ac9:b0:59d:e5ab:4905 with SMTP id
 2adb3069b0e04-59e38c041e9mr606622e87.9.1770189060550; Tue, 03 Feb 2026
 23:11:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121105801.1827-1-msuchanek@suse.de> <176973225791.178709.17831414346066426792.b4-ty@kernel.org>
In-Reply-To: <176973225791.178709.17831414346066426792.b4-ty@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Feb 2026 16:10:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARWymjMAZZSiAcduUCB_jk7K3qPtQ7okabp6ajwT2yz-g@mail.gmail.com>
X-Gm-Features: AZwV_QgpRjyvb2KrbCWK07f8mucTwtZGSnnBsJJsdnV30ZhIlijperd9AjSxMPE
Message-ID: <CAK7LNARWymjMAZZSiAcduUCB_jk7K3qPtQ7okabp6ajwT2yz-g@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11019-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[masahiroy@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 808AEE28BA
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 9:17=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, 21 Jan 2026 11:57:57 +0100, Michal Suchanek wrote:
> > DRM_MSM_VALIDATE_XML depends on a python feature. Add a dummy python
> > interpreter to make it possible to configure this option with dummy
> > tools.
> >
> >
>
> Applied to
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild=
-next
>
> Thanks!
>
> [1/1] kbuild: dummy-tools: Add python3
>       https://git.kernel.org/kbuild/c/76c73cfde7988
>
> Please look out for regression or issue reports or other follow up
> comments, as they may result in the patch/series getting dropped or
> reverted. Patches applied to an "unstable" branch are accepted pending
> wider testing in -next and any post-commit review; they will generally
> be moved to the main branch in a week if no issues are found.
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>


This was unneeded because we can pass PYTHON3=3Dtrue
from the command line?


--=20
Best Regards
Masahiro Yamada


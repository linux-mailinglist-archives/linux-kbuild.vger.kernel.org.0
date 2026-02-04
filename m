Return-Path: <linux-kbuild+bounces-11020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDvWLwbzgmmWfQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11020-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:19:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BBE29FD
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ECF430495C2
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 07:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FAD38B991;
	Wed,  4 Feb 2026 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJcdTvQv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7676D389DEA
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189484; cv=none; b=pjVEU6e3meQQ4N1o18lgxHeYp8A3ybyTRDBC9+u03jk89BjEXvelKJd1Ju4jj2RVm/df8yZGb6W7hnTibw5EX+6R8qYE0UBNTpeEVKlXSJmIHNjb1eXNcEtG39AsIhEbCM7iBQU3LeZZeYLlCjd0VQ4F9xpAcg6UpM6zkzjT2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189484; c=relaxed/simple;
	bh=xqEaS4t9FRnmZ36Z7kk86sLrpTUR7ghxRnVs3pmlOYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcX8T6drko4niuJrPu41BVs0umVZFRaNNVgDLpuYQt14efsOLFwLBub/VEJHbzUjaV95glJty4X1n0JOKBW8qy55GcGBHdJ8pWXc8Xh1zsCD6Dz5JNcjTtclSPgnnvkL10Eokn0XWnZPk4sgwXZGmO3r163KdLj1xtXjhFa+XZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJcdTvQv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D075C2BCAF
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770189484;
	bh=xqEaS4t9FRnmZ36Z7kk86sLrpTUR7ghxRnVs3pmlOYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lJcdTvQvg9F2T0iytEUshtCCgKZ2bo867fdv+DxB2zOBVUDINCNEP2UIx/QKBqvh6
	 uKKLJuKeDOIgQNY8yI7tdgxL5zgGT7jfVCbOYsCXwwcV5S4FKtWbYcPDbt4HxiVngN
	 jjYmTnZwE1Um+OoyBsuKteBUoSNCUqC9fg4/YsGuij5vcFg191U5cgxCjtBA6cCPQn
	 p4VrC91Lgej3IBLPGwisbLOee5Gb7+Qm+6D9rYfMo3n89M7Oh9Jf+gi3PNcnKQaxmM
	 rWeEWKu51NYblEJ3cSdODH3tdwMcFf+qmopnXnIwY/ByYEe6K4OswLgNwF6G/ltDwL
	 0gCWBz3ADXVcg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37fd6e91990so65088811fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 23:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSJeEG7uLllrIp0+PJmFDcQJOZthvUcUInFsQzZWOLtbhIER6KT0i6ZLgYaSFcsQcgMwCS7uSB/QhFZI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo2XCf2q2Va9cwNviS3rYXkXePYCOvn8kzgMfmaUjgvvnUV/Rl
	kuhmDfOU5zsUxG6jBcaMgz2/DoxKPdPnB/SK9sSPaklm7Zs3Tk7SRIH+Jt8p8R+zsK28k18h8o8
	FKo2uMxlM70o+MtXS14qeBNocxlYTW+w=
X-Received: by 2002:a05:651c:41d6:b0:37a:316c:2ae6 with SMTP id
 38308e7fff4ca-38691c6ddfbmr8511521fa.1.1770189482784; Tue, 03 Feb 2026
 23:18:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-docrem-v1-1-dcc69059a5cb@google.com> <177016418652.1146354.981060291224113155.b4-ty@kernel.org>
In-Reply-To: <177016418652.1146354.981060291224113155.b4-ty@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Feb 2026 16:17:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdG9P90Hnc3M4zK67S_kRtcs5kv8MX7n_B6S5x=FKENw@mail.gmail.com>
X-Gm-Features: AZwV_Qhv3WtNNvxTUQ-d1mg7cmq3K4RcHgjbMWmfHATCGGsacJpyjJqqJ61h2Uc
Message-ID: <CAK7LNASdG9P90Hnc3M4zK67S_kRtcs5kv8MX7n_B6S5x=FKENw@mail.gmail.com>
Subject: Re: [PATCH] rust: kconfig: Don't require RUST_IS_AVAILABLE for rustc-option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11020-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[masahiroy@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 385BBE29FD
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 9:16=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Tue, 09 Sep 2025 18:14:20 +0000, Matthew Maurer wrote:
> > The final version of this macro does not fail in the absence of an
> > invokable `$(RUSTC)`, so we don't need to be careful not to invoke it.
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
> [1/1] rust: kconfig: Don't require RUST_IS_AVAILABLE for rustc-option
>       https://git.kernel.org/kbuild/c/f2445d6f264c6
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
>
>

Removing this comment is correct, but please note
the commit description is not accurate.

Kconfig evaluates all $(shell ...) macros before deciding the
value of RUSAT_IS_AVAILABLE.
You cannot prevent Kconfig from evaluating $(shell ...).
The author of c42297438aee7 did not read
Documentation/kbuild/kconfig-macro-language.rst



--
Best Regards

Masahiro Yamada


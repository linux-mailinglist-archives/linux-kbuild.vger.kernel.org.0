Return-Path: <linux-kbuild+bounces-13157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LqGIt/MBWpGbgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13157-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 15:23:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB054247C
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 15:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 227053084649
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 13:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9553911D5;
	Thu, 14 May 2026 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4B6+fxL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398582DF13B;
	Thu, 14 May 2026 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764780; cv=none; b=u9KZRhT0LTW4odVMOg6ryxY2eLV+xL3df8pF0s2cRrmOftFXJIvT+weCEvABoWKevkYwy2iUmYIWB9j3lqOFGlL8F7yjIMK8uVf21sM798T+qUL1MwjCvzeOnJ+IKgqA4QDSchvXLSxUxb1sHqRPmZzndrz70XVt9CuSyJCG/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764780; c=relaxed/simple;
	bh=Hp98z3AfJbk77s9wj+DffOPyQUh4he1zidUEz2sHUk8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=i+5vyhvvxVotcWRnWu13u1DyDN70DpR5ZOpAvvCaQjxbAx7mVIK403LEXgOExhNO8nYJc1yrGW/gdw5BOTkI2SMVq/UyGbvMbqiuPqczv1y1D+6jZNZStbUjF+HNg0swQEvQNT7EYbsCo2JMrPCt5SmXMG0DzWHeYpIpDlliJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4B6+fxL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0A5C2BCB8;
	Thu, 14 May 2026 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764779;
	bh=Hp98z3AfJbk77s9wj+DffOPyQUh4he1zidUEz2sHUk8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=M4B6+fxLv5h7NpzW2oof0JcNgx3O+aXAl0tWaZ3310ZcLFqJpj6Qxg5W1PMNd5CCb
	 tMZDbCIXGcPCX5JJIaJ4LF6GmPMl5ceqHYR7oZj2CjH5h6RvkvG6I3+m6A4qQkHgg+
	 /dbFfLIKhJQMY0rrErQQpwJuVXfeKX9yArIoceLz2PwWA9ZnYdyT0YCyGiD/9y9Hzf
	 K632dgjPDx8sFmAEMmDn9/uxKBAKunefh8eZnHz/wlPyvBI7oUbCn0hvqfjlrRf94U
	 5wyIUgVJhwBxlVUMT2Ez4sAAi6hfzEC8IOIg5xeFdEdMjuOhRsLSEMuUmlrFufRsh1
	 LWhocMECz58OA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] kbuild: pacman-pkg: make "rc" releases adhere to
 pacman versioning scheme
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Viktor_J=C3=A4gersk=C3=BCpper?= <viktor_jaegerskuepper@freenet.de>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Heusel <christian@heusel.eu>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260513231745.51780-1-viktor_jaegerskuepper@freenet.de>
References: <20260513231745.51780-1-viktor_jaegerskuepper@freenet.de>
Date: Thu, 14 May 2026 22:19:28 +0900
Message-Id: <177876476891.305249.12721845256238248028.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Hp98z3AfJbk77s9wj+DffOPyQUh4he1zidUEz2sHUk8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmsp18+dLu440PP3aToR/sVFwdwWRZk/lDwEzY3fMe62
 ejHBX+GjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjAReyaGP5z36myvvQ6oLm+/
 MNPm5A7b3ORVv93Zz+5XiVoqcufpA1lGhrb7V8/VVF/c1HeT08jx+/IgycrJ/669z8h6UdUvLH1
 0OTsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: DADB054247C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[freenet.de];
	TAGGED_FROM(0.00)[bounces-13157-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[freenet.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

On Thu, 14 May 2026 01:17:29 +0200, Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de> wrote:
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 452374d63c24..fe629074b4e8 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
>  	pkgname+=("${pkgbase}-${pkg}")
>  done
>  
> -pkgver="${KERNELRELEASE//-/_}"
> +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-rc/rc/;s/-/_/g')"

Sashiko notes [1] (with a contrived example) that this could result in
custom localversions being matched and adjusted. While I don't think it
is that big of a deal given how specific the example is, it takes little
effort to make the match more restrictive to make such a situation less
likely:

  pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"

[1]: https://sashiko.dev/#/patchset/20030

-- 
Cheers,
Nathan



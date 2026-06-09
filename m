Return-Path: <linux-kbuild+bounces-13686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MO5yM5+nKGpPHQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13686-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:54:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0AF664DAB
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lTUYgUz3;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13686-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13686-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9803B3015446
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 23:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D0D37A485;
	Tue,  9 Jun 2026 23:51:25 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54901E492D;
	Tue,  9 Jun 2026 23:51:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781049085; cv=none; b=Oo69QqJ131eXgaSsmRqgqWude7kywKfs7R+vYHs2OkpOh7wKxCyE5hAkGYh0HDqNdaz/mM/dn8orGitXe+RBfKDv5fV0H9dr7KeqZ/zAyzMx1yWsBeFcq/BJ4tm55XGWDhm1XPLDpP8FZZRxrSOhi1a6zG+Ylt39I/iqtjSmvWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781049085; c=relaxed/simple;
	bh=Vyr+KMrlmuFfvy74m/59of/SuyIpDkHClr60ZNAXz+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YqcLCxMsEzddx5mNLgAGWgbaJpVT94bxuaJ9UjtSU5Yxn2HInRxzynwY147QLn9C2nUdRLoitEflZSxILQHpzT3ktgN7CLr+EZW4PKtfTXNa/tMMprhOTBNUxMJlwS+5MV5v+zDHf5Iu+ecTJ8ub4jnUFHpwwjf5+madwkXtJmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTUYgUz3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B261F00893;
	Tue,  9 Jun 2026 23:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781049084;
	bh=sAM1OjvV4RCwTsEIs65/1PqOKnexTxy5ur/iwOgCTSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lTUYgUz3Mdv7RPVcFILnc3/AFwXeanB+AJJJxW07H+QCgQbpM5ByJFdy/NEuIzKvk
	 DguYVORopKTN8OQpNUyIE1ulMqH91/0XUfjj1ZGq4lpiACMlWLwXlj4VHgsjvoTxzn
	 El/edqU1dvHDVE6YxV9pU+gM4e8KwkZ7F3sl5s4+PVp+rLlhBJ3XvQ+uuOPPL3qFIS
	 KX2BYI7k6vzyhEY9B5WOrrawG6I2bWMVbsg4X0MyigrY8Mp06wYhKprAUqO1tmd/bN
	 iGQnAAhL98N9txhAynrxFpLUif1QlktU0OMDTNGLa4zfedTo/jCNelGwwwG+tP8ZeY
	 QPtHxYUnITtcA==
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Yonghong Song <yonghong.song@linux.dev>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Stafford Horne <shorne@gmail.com>, Piotr Gorski <piotrgorski@cachyos.org>, 
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
 Teresa Johnson <tejohnson@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 xur@google.com
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260529185347.2418373-1-xur@google.com>
References: <20260529185347.2418373-1-xur@google.com>
Subject: Re: [PATCH v12 0/3] kbuild: distributed build support for Clang
 ThinLTO
Message-Id: <178104893725.2707941.7165957214704818524.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:48:57 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2283; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Vyr+KMrlmuFfvy74m/59of/SuyIpDkHClr60ZNAXz+E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkay75vKGk+Xtg851D/R94Snl0f3qe9XpRs6xCyK6Vv1
 tRPelExHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAihtaMDLOC5tislvkgc3Tf
 f22Bvb4XJYUlryeYBDX+P7DkceqMr0qMDMtUpf78UGyNfWQ2w9f7a+GXlJ8zGy1ak29O613JfTj
 DlR8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:masahiroy@kernel.org,m:nicolas.schier@linux.dev,m:nick.desaulniers+lkml@gmail.com,m:yonghong.song@linux.dev,m:morbo@google.com,m:justinstitt@google.com,m:ojeda@kernel.org,m:aliceryhl@google.com,m:samitolvanen@google.com,m:rppt@kernel.org,m:aquini@redhat.com,m:mpe@ellerman.id.au,m:shorne@gmail.com,m:piotrgorski@cachyos.org,m:venkat88@linux.ibm.com,m:tejohnson@google.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:xur@google.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,redhat.com,ellerman.id.au,cachyos.org,linux.ibm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13686-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F0AF664DAB

On Fri, 29 May 2026 11:53:43 -0700, xur@google.com wrote:
> kbuild: distributed build support for Clang ThinLTO
> 
> From: Rong Xu <xur@google.com>
> 
> ChangeLog:
> 
> V12: Fixed an build error reported by Nathan Chancellor:
>      Reverted to v10 shell script based approach to get saved_c_flags.
> V11: Integrated feedback from Sashiko (Nathan Chancellor):
>      (1) Included modkern_cflags within the saved _c_flags.
>      (2) Replaced the shell command with $(saved_c_flags_$(<)).
>      (3) Refined the file matching for ar_vmlinux.a.
> V10: Fixed a minor build error in v9 and added comments.
> V9:  Fixed a minor build error.
> V8:  Disabled -always-rename-promoted-locals=false for the distrubute
>      mode, based on Yonghong and Nathan's comments.
> V7: (1) Resolved a conflict by rebasing to kbuild/kbuild-next-unstable.
>     (2) Separated the '--thin' to 'T' change into its own patch to
>         preserve Masahiro's original version.
> V6: Change '--thin' back to 'T' in Makefile.vmlinux_a to fix
>     reported the build error from old ar.
> V5: Handle single quote escaping in echo _c_flags to fix
>     Piotr Gorski's reported error.
> V4: This is based on the reimplementation provided by Masahiro Yamada
> on May 26. The difference is that this version now saves the compiler
> flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> for the subsequent Back-End (BE) compilation.
> 
> [...]

As noted elsewhere in the thread, I squashed patches 1 and 2 to avoid
bisection issues.

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
      https://git.kernel.org/kbuild/c/9c72d26e9fe3b
[2/2] kbuild: distributed build support for Clang ThinLTO
      https://git.kernel.org/kbuild/c/9f2aee8f7d184

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan




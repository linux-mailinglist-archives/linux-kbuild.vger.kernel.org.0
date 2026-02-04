Return-Path: <linux-kbuild+bounces-11010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPA5BOCPgmkMWQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11010-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 01:16:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC6ADFF71
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 01:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81A9B300B9C0
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 00:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5AE13A258;
	Wed,  4 Feb 2026 00:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im/Shf9V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB41799F
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 00:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770164185; cv=none; b=Bq14FAORAMpWlRNF+io3jZkEQNELus3m2TmVOKsTTTzamCLbYTqKfSM4/2WE4/eqGyJwKuNnneM3QGVtr9C+N3zIL6ZFzHOnDCi9ywLNgezGD2u8tfjaPDeeEJ+b0Pn5ma6WdNepO0heIaXJA1Upv6Oal4YVx3W1ngMesDHiKEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770164185; c=relaxed/simple;
	bh=K80kjauj3gB7Jo17QjyW9fAJg5bQlHqWL+gHT3QaFro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UdeNGU0FpGFAqKZGPeba4mDipUHgB5HX4YdtskUkvRj2vHVRna1it/7CBruQqI1OZ+NU/TnG+fLWJzeH1GDAOldE4GsSu1j1NTfp1LTq1aJQwR6dKBozf29cBDrd44ZrZvf1x3XP54behLAW9ij+OsPZi5xRaoWO+BctpWjt4U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im/Shf9V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFE0C116D0;
	Wed,  4 Feb 2026 00:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770164184;
	bh=K80kjauj3gB7Jo17QjyW9fAJg5bQlHqWL+gHT3QaFro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=im/Shf9VnRED7e3BqjPU7hhTcrS51pSwo3vFZMKdMyEGkCCwShiX/ao9QZJgFak7H
	 DktQyuLhHypAfvQegTSwPDBexF1MvC3EUx92ZHwnLYxTUtdoHzfs+ZPK0yafYujAh7
	 OS8k1D38dK2XlihAsNaYQAj9kWB1txpfXCPs0KkrDWL5L2gd+9N32bU0a3815IP2XV
	 bdd2RRBENSuiaS37s8tHvUOwis5pT1RqLN0Z0GqSGwC9/pBILXek+K+PP9PXzuC5cb
	 /qopjQBBWJfwZpGTjP94qEiCG47OB9MOHmHVwhbolUOlTeHapsdUSz1YVy6uxFt+3l
	 /E37sJhwCuWCg==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <chleroy@kernel.org>
In-Reply-To: <20251123.131330.407910684435629198.rene@exactco.de>
References: <20251123.131330.407910684435629198.rene@exactco.de>
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
Message-Id: <177016418333.1146354.10778952252153726089.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 17:16:23 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11010-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BC6ADFF71
X-Rspamd-Action: no action

On Sun, 23 Nov 2025 13:13:30 +0100, René Rebe wrote:
> Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> save/restore symbols, that the linker generates on demand into the
> .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> too. They are needed for the amdgpu in-kernel floating point support.
> 
> MODPOST Module.symvers
> ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> WARNING: modpost: suppressed 56 unresolved symbol warnings because there were too many)
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] modpost: Amend ppc64 save/restfpr symnames for -Os build
      https://git.kernel.org/kbuild/c/3cd9763ce4ad9

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>



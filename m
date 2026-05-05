Return-Path: <linux-kbuild+bounces-13030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOEKIJ4W+mkMJQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13030-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:11:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E14D0F32
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0A03040954
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 16:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAAB47DFA9;
	Tue,  5 May 2026 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4KZhHGr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973534677D;
	Tue,  5 May 2026 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997136; cv=none; b=eeRUt7CdVWPFaT0r3HDN1gQ/4hItCHLhdIjqada1GDz4J1MZHTAA40UL+zHxVRJlr7ZZWmlZubuYkNfef77drDKWMaL/kx433zpMeupCtoOY5GBWp7xbUz4YTcGf3r8exyblCfVHuFlA9QU8exccE+YbCQeE91nPuGu0vkHUiXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997136; c=relaxed/simple;
	bh=z41/iI4Q5CcjWzRsTGIHP4u/6tewncyqKGLKwc1SwdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCT3x12u69jzf0KJoshHHx30/7GDbTluHXL3bvmaX4fDvYkCZXj4DFmV+wTlfpH3y/hMR4oQJ1eXN9y1rQxHg5YIWb6QS4qFTNy4TgKeOhyuqSf22Q2B+kTJg7t9saVuMKhnbhdzYPpxaC+pdlvYwJ+JpTAPj6cV5/Kp9oTOGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4KZhHGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85B8C2BCB4;
	Tue,  5 May 2026 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997136;
	bh=z41/iI4Q5CcjWzRsTGIHP4u/6tewncyqKGLKwc1SwdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4KZhHGrf13LBn00euvrXzClYenIO1S8hxPDnIgCOim8vDH3tN4e339xkLkYWEOP9
	 PWDNElyotskYJ/OZX2fxddKc1o7YR3D1DhJw2lyLK9AG30ADrXtJjNiQhDf5wn/JqS
	 Tx2K0rqTO6rYLd4cBEEDqK/Xvw2wBPvXwRIEWCe/lRET2qC904EF5HwfrqOjXeTYI2
	 jLPKbKdGWDaQCWxhTCR48vnYiaMCcww/2k89d5X910xnxxSv2KB5suMeO5C9Li/PfP
	 dKZcaoDzIgODyE78IT6RJKNvkoDzcYtBFMJkzhjKy9seRpex7mUYShZ5EQBvy/9NM3
	 MBDNaNQ7LVM0g==
Date: Tue, 5 May 2026 17:27:00 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
Message-ID: <afoMRMnSQUwk1eaN@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
X-Rspamd-Queue-Id: DD7E14D0F32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13030-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,vger.kernel.org,lists.linux.dev,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,lwn.net:email]

On Tue, Apr 28, 2026 at 10:59:07PM -0400, Nathan Chancellor wrote:
> The current minimum version of LLVM for building the kernel is 15.0.0.
> However, there are two deficiencies compared to GCC that were fixed in
> LLVM 17 that are starting to become more noticeable.
> 
> The first was a bug in LLVM's scope checker [1], where all labels in a
> function were validated as potential targets of an asm goto statement,
> even if they were not listed in the asm goto statement as targets. This
> becomes particularly problematic when the cleanup attribute is used, as
> 
>   asm goto(... : label_a);
>   ...
> label_a:
>   ...
>   int var __free(foo);
>   asm goto(... : label_b);
>   ...
> label_b:
>   ...
> 
> will trigger an error since the scope checker will complain that the
> cleanup variable would be skipped when jumping from the first asm goto
> to label_b (which obviously cannot happen). This issue was the catalyst
> for commit e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on
> clang < 17"). Unfortunately, this issue is reproducible with regular asm
> goto in addition to asm goto with outputs, so that change was not
> entirely sufficient to avoid the issue altogether. As asm goto has
> effectively been required since commit a0a12c3ed057 ("asm goto:
> eradicate CC_HAS_ASM_GOTO") and the usage of the cleanup attribute
> continues to grow across the tree, raising the minimum to a version that
> avoids this issue altogether is a better long term solution than
> attempting to workaround it at every spot where it happens.
> 
> The second issue is an incompatibility with GCC 8.1+ around variables
> marked with const being valid constant expressions for _Static_assert
> and other macros [2]. With GCC 8.1 being the minimum supported version
> since commit 118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30"),
> this incompatibility becomes more of a maintenance burden since only
> clang-15 and clang-16 are affected by it.
> 
> Looking at the clang version of various major distributions through
> Docker images, no one should be left behind as a result of this bump, as
> the old ones cannot clear the current minimum of 15.0.0.
> 
>   archlinux:latest              clang version 22.1.3
>   debian:oldoldstable-slim      Debian clang version 11.0.1-2
>   debian:oldstable-slim         Debian clang version 14.0.6
>   debian:stable-slim            Debian clang version 19.1.7 (3+b1)
>   debian:testing-slim           Debian clang version 21.1.8 (3+b1)
>   debian:unstable-slim          Debian clang version 21.1.8 (7+b1)
>   fedora:42                     clang version 20.1.8 (Fedora 20.1.8-4.fc42)
>   fedora:latest                 clang version 21.1.8 (Fedora 21.1.8-4.fc43)
>   fedora:44                     clang version 22.1.1 (Fedora 22.1.1-2.fc44)
>   fedora:rawhide                clang version 22.1.3 (Fedora 22.1.3-1.fc45)
>   opensuse/leap:latest          clang version 17.0.6
>   opensuse/tumbleweed:latest    clang version 21.1.8
>   ubuntu:jammy                  Ubuntu clang version 14.0.0-1ubuntu1.1
>   ubuntu:noble                  Ubuntu clang version 18.1.3 (1ubuntu1)
>   ubuntu:questing               Ubuntu clang version 20.1.8 (0ubuntu4)
>   ubuntu:resolute               Ubuntu clang version 21.1.8 (6ubuntu1)
> 
> 17.0.1 is chosen as the minimum instead of 17.0.0 to ensure that the
> particular version of LLVM 17 has the two aforementioned bugs fixed, as
> the second was fixed during the 17.0.0 release candidate phase and it
> was not until LLVM 18 that LLVM adopted the scheme of x.0.0 being a
> prerelease version and x.1.0 is a release version [3] to help with
> scenarios such as this.
> 
> Link: https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14 [1]
> Link: https://github.com/llvm/llvm-project/commit/0b2d5b967d98375793897295d651f58f6fbd3034 [2]
> Link: https://github.com/llvm/llvm-project/commit/4532617ae420056bf32f6403dde07fb99d276a49 [3]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/process/changes.rst | 2 +-
>  scripts/min-tool-version.sh       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 9a99037270ff..b9afce768446 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -36,7 +36,7 @@ bindgen (optional)     0.71.1           bindgen --version
>  binutils               2.30             ld -v
>  bison                  2.0              bison --version
>  btrfs-progs            0.18             btrfs --version
> -Clang/LLVM (optional)  15.0.0           clang --version
> +Clang/LLVM (optional)  17.0.1           clang --version
>  e2fsprogs              1.41.4           e2fsck -V
>  flex                   2.5.35           flex --version
>  gdb                    7.2              gdb --version

FTR: The translations
Documentation/translations/{it_IT,pt_BR}/process/changes.rst become now
even more outdated.

Acked-by: Nicolas Schier <nsc@kernel.org>


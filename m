Return-Path: <linux-kbuild+bounces-11899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDCsLCcotGkQiQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11899-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 16:07:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A1D2858F8
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 16:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E3DE310E44B
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120E3A6EF1;
	Fri, 13 Mar 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPaxMjxN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4613A6B95;
	Fri, 13 Mar 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413466; cv=none; b=IOFsXYH/KmwNoz0SXh4PLCgc6q5LAg+vYNh3DU7Nar83fne1OlfdSWSDHdevlvERiJuBCEQcvZ+WV98h9LNkgtK83fFVdbv17MTTwKm6P3dkGKf0ZAUmWRNk19+gtqeEf2eWcxR4rUYbkyuAP1BKOWiSoqmbSALDTeQuSWjZDnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413466; c=relaxed/simple;
	bh=x4CLjv1BuiMM6J1TwTgZoVYKrp/Ony7pvAy8sYSJCGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ag9KMh+E8rA5/ya4w1nyt17nnj+K2kEaWlXGSscM40dTf385G1m8tUjZBI/uMrO5CvMqife8ETfmUXRINoRg+yJoAggt9L2M+ZnbEqDe4bsR7ReXC17yLerR+pzef31aoL9D5Fd5QExSHoS/MGHRrtOwy2KD520yBt4XkIqwbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPaxMjxN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DDBC19425;
	Fri, 13 Mar 2026 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773413465;
	bh=x4CLjv1BuiMM6J1TwTgZoVYKrp/Ony7pvAy8sYSJCGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPaxMjxNlE+Uxe1YjNBS6mdPsZaE2Qhs33r74b0MDZ/ljRWvJ4pli1u1JL145EJAq
	 KmeHmx9KJnnmnuXsXb9+Et/mLQKIVXd1Elh9qRh7j5KDuKep2kirB5sNMhNk0Cb7Iy
	 ol9anLoK40NSLwCRUZNBvMPm++GGsC3QjITbkGInlLBLFqUfjStpfCoAmowL47ryqB
	 pSfXKvSrf6EiNWVmpo+nX9u89c3LTG4uIORUeBJZfU6Es1HlXwmMsyhCu3SRUFg7M/
	 2KhkLaRqPMTAlTbHLDCUAzUsJdEs8upY+Tvqo7mHJs9mubxzPeyz+555D1Ogm6x7fv
	 n/5yfIm3WJX8Q==
From: Nicolas Schier <nsc@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Teresa Johnson <tejohnson@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	xur@google.com
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang ThinLTO
Date: Fri, 13 Mar 2026 15:50:57 +0100
Message-ID: <177341342967.122688.9836334888320791021.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028182822.3210436-1-xur@google.com>
References: <20251028182822.3210436-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11899-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,redhat.com,ellerman.id.au,cachyos.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32A1D2858F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 28 Oct 2025 18:28:20 +0000, xur@google.com wrote:
> ChangeLog:
> 
> V5: Handle single quote escaping in echo _c_flags to fix
>     Piotr Gorski's reported error.
> 
> V4: This is based on the reimplementation provided by Masahiro Yamada
> on May 26. The difference is that this version now saves the compiler
> flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> for the subsequent Back-End (BE) compilation.
> 
> [...]

Applied to kbuild/kbuild-next.git (kbuild-next-unstable), thanks!

[1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
      https://git.kernel.org/kbuild/c/45192218
[2/2] kbuild: distributed build support for Clang ThinLTO
      https://git.kernel.org/kbuild/c/8e786d89

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas



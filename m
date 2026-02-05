Return-Path: <linux-kbuild+bounces-11042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJeuEl7uhGkU6wMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11042-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 20:24:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8CF6CEF
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 20:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA7DC303B17A
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Feb 2026 19:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D8B327BF6;
	Thu,  5 Feb 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJNwh4mO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6A32694C;
	Thu,  5 Feb 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319414; cv=none; b=bSsVLy1mVSlFwWyaK0uvTO9uNAU+hS2McNeGgfWwYrT7vd80arcdNpfJ/l5GAer0M8U7CFzcFOhqrX1DWlVhC92XcSkE6cW5VFKYkBQqINakZJCxXOnImYHjel9x2jSSHgGIqavxjYzzvudGFfjAiSiVxOI4s6xUb71ANGRC6IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319414; c=relaxed/simple;
	bh=G1U9qmKeYw7srGWrHZGGnGjqRH6CMWDQPVKmIp3JezE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M9Ri9DBZatPr4TGVlm8/iGvwechfome5y2yz2sgboiRViS9+UKeU9+r6RBtr/V3/j2B9UI0ERcspStjligOa7fCAwwaMtVssyyu3rdOFwvpGN42jPio8Vq6LgnJB4l7LBWwg6AriZzZx6jBtcLgG/7LBDG0dEqQneUjy0mNnFIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJNwh4mO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAC8C4CEF7;
	Thu,  5 Feb 2026 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770319414;
	bh=G1U9qmKeYw7srGWrHZGGnGjqRH6CMWDQPVKmIp3JezE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RJNwh4mO/IzcwBr//npGg7UaMqf+CpIBk1v1Eg26Sum57PvQyj8eZmy1mJGKak/uw
	 7YdiVZpidR8JBMEJWa9W/Ip2N96p6xmjUz5WyctsNQKDugg1lkculV0XaougDrVKGw
	 06vWWgCi/e18OoYwS1VUUGf8VsitfAmfJemc+8lUpj9TmMOwv7VcQdI3YMOpi2Nb+V
	 0i3KNvaozU/njDcWkzmHlfGCtBWcw7O5PXbh2OAvLSkTWs8zUavYuYim2sO4Lkiazr
	 WmyAGsac3x7Zspfm2Y8jRrMAvA7TyX2zo6TzXPSzvbJw5WynP9PJRD0okbYaiNmtUd
	 yR9HrJbF2iB7A==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 =?utf-8?q?J_=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Tom Rini <trini@konsulko.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Alice Ryhl <aliceryhl@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, David Sterba <dsterba@suse.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
 Nicolas Schier <nsc@kernel.org>, Petr Mladek <pmladek@suse.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster
 operations
Message-Id: <177031941047.2027657.11296594038346797555.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 12:23:30 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-11042-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7D8CF6CEF
X-Rspamd-Action: no action

On Tue, 06 Jan 2026 09:27:30 -0700, Simon Glass wrote:
> This series updates 'make image.fit' to support adding a ramdisk to the
> FIT, provided as a parameter.
> 
> It also includes a few performance improvement, so that building a FIT
> from ~450MB of kernel/module/devicetree files only takes a few seconds
> on a modern machine.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/6] scripts/make_fit: Speed up operation
      https://git.kernel.org/kbuild/c/621fd65adc825
[2/6] scripts/make_fit: Support an initial ramdisk
      https://git.kernel.org/kbuild/c/26428e7dd6a51
[3/6] scripts/make_fit: Move dtb processing into a function
      https://git.kernel.org/kbuild/c/873c2836982e1
[4/6] kbuild: Support a FIT_EXTRA_ARGS environment variable
      https://git.kernel.org/kbuild/c/9a329df6e0041
[5/6] scripts/make_fit: Support a few more parallel compressors
      https://git.kernel.org/kbuild/c/fcdcf22a34b07
[6/6] scripts/make_fit: Compress dtbs in parallel
      https://git.kernel.org/kbuild/c/c7c88b20cd422

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>



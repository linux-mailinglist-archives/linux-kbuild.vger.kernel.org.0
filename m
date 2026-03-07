Return-Path: <linux-kbuild+bounces-11639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNqWGxvdq2nOhQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11639-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 09:08:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B264122AB64
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 09:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CEBF301983F
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Mar 2026 08:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D73378803;
	Sat,  7 Mar 2026 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gt7tnGrc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD922224AF0;
	Sat,  7 Mar 2026 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772870936; cv=none; b=WKL6gubMCJ5QV2Act86G8QGvkFmyYPHleEMU6W4YTYmpRDTjM5AVI7NGoExB+MQXqIVu6FsfSk/oj3P54YZM6QNY7fw4RbNdzIP2wqxFTIZQqVtiAy3oB6d1kT+2iRmACNtFT4frNPxxnlUwA0/uMTs+DkHlKz05u3Y1I1HeWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772870936; c=relaxed/simple;
	bh=WzysFsYagwwRxUbpcTA6UymBVSjxX8+jkf+RySyrOpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6bts1d38vFyzG+c9IMPjLTwrAv1YcrN2jIgVPUK/w0a5f8VT9zXkorkLSmFgtsi7HmRAbosFzOSLbz9cPqa9a3UJO+3J2NhSDqlFIaee9YGdSleyTpNLIio8MytaoGnN4ugTHI9zYtw56cOr8JjKK1fKgSnXm9OdTWoPpHGtZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gt7tnGrc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3E7C19422;
	Sat,  7 Mar 2026 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772870936;
	bh=WzysFsYagwwRxUbpcTA6UymBVSjxX8+jkf+RySyrOpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gt7tnGrcqEImzzWTntGZrAyqSwT9I3svMXmC3NNC4+bISmEy39xWjcuV6NB5F7+f3
	 IppzPY5X3RAPjFDLZKgSVl6n9Det//Sz+F8YMHDWqC/UnTiO2XMkWTHhOoM9uzD3Lm
	 //EcKQJMY7y50QrtJ1RmTe0HeW8USDJUYCxEZueu05DLWgV5udHHNSZtMVcD8nc8Bp
	 V4Mb4CYY4wu6RBAj1o67LC5773S68FG1yqLPyKL1ttT55TfJeXPM6yLtcAmxw7dlt7
	 qYBGBR00U8sFk3jReaHMLCAPzg8nUcpECr3vZWbniodTOhUn4HwN/KX7RDRYP9bcqq
	 rS4ShkYt3NDyw==
Date: Sat, 7 Mar 2026 01:08:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
Message-ID: <20260307080852.GA2685454@ax162>
References: <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
 <20251028174541.GA1548965@ax162>
 <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>
 <20251031220732.GA2254630@ax162>
 <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
 <CAB95QARrcOc6h9=YTzLKkNE0dEaivtiLfK0kEQ1jNp+v1w4yzA@mail.gmail.com>
 <CAMj1kXG_kPx5=3Qbn6ZTpKqOYh-mehwrH+d6Bw8QEPqvhZy1nw@mail.gmail.com>
 <CAB95QAS__YYYBLc3KFjBUg_QqC3AOB0y6kvhSqZFR9fx7BDKvg@mail.gmail.com>
 <CAB95QAQyzYTrnGrkrcwXJ7Za37v7VsvwsmUezb1Z4VsF_RdLMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB95QAQyzYTrnGrkrcwXJ7Za37v7VsvwsmUezb1Z4VsF_RdLMQ@mail.gmail.com>
X-Rspamd-Queue-Id: B264122AB64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11639-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.976];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Eugene,

On Sat, Nov 08, 2025 at 10:06:20AM +0100, Eugene Shalygin wrote:
> I've got no response from the rEFInd author yet, but another user
> reported (https://bugzilla.kernel.org/show_bug.cgi?id=220731) a very
> similar problem with GRUB and ZSTD compression.

Small necro bump: I think this might be fixed in mainline now with
commit 8678591b4746 ("kbuild: Split .modinfo out from ELF_DETAILS"). It
should apply relatively cleanly to stable versions (and should make its
way there in due time due to the stable tag).

Cheers,
Nathan


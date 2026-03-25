Return-Path: <linux-kbuild+bounces-12251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNfNLkbYw2lwuQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12251-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 13:42:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FFC32510A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 13:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17C2A30F9F95
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 12:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35443CEBA5;
	Wed, 25 Mar 2026 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM33kyn8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7B3C344E;
	Wed, 25 Mar 2026 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441350; cv=none; b=lofEW6nBLAu+RtKXbTZxpY3JiLJrxQO6deDKnQPaEyJpOM2yYIUni488b4OLs+BfcXoiz/ORY5WRYWnhAMOy67ne0nxE7sTZY1/GBjduj7uAgTu5et0MCGLwbormg9j5fyqWhc7LZn4Yfs92OZq9LQ0kmgqT/7PRF7CbmjoWvBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441350; c=relaxed/simple;
	bh=jR++UhQwlnzd6tQ1GyMO+/4oIFawypTF5Dxm1zLj5gY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QNyHbCFPUBrsYHO0Bdyw89OTSKuyYjhvmnys0UGW1/wtpK+QCVRA95SnY42BM8vV0mG//WPgRKWNEd2JHS5E4CUyUIX7SQQXm1J2z287wl/zp3kNjHBAQXPnlXiUjFzC3WMn+X+QZgXytA7e0xtgiEn3oFdryguJHWvKRLZoQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM33kyn8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DA4C4CEF7;
	Wed, 25 Mar 2026 12:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774441350;
	bh=jR++UhQwlnzd6tQ1GyMO+/4oIFawypTF5Dxm1zLj5gY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=PM33kyn8vitYaRmDSHgKSEHxqs8XTeSaT9T3kixyJCkqUq2/P6SEq0HmjRvoGiivw
	 4Ypu0ffZINEuqVXrtH6WPJamQ9hI23CKlJdcfwQryS9r3jCUnc/vx01Te3i+f1Fi9+
	 hX4rhDtkQGJoSDT8o1e9KbOB4FvXPY1WqP79Z43QXnsgLe8SV2/GvVdj4LY4DgfXhY
	 jmRRUq4x5onfkLBeP5woSaxH8z2YI7qYI+cCoWbrql7Opj4C2KO76EylQtUqb95j3D
	 BttdjOCJJ/Hp2B86cy9jXleGoqkLkZnqvaTylp0jQDzZZ+tVo0F2wKcGO4ZToY77M3
	 gIojBL+hhGtvA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/2] kbuild: move vmlinux.a build rule to
 scripts/Makefile.vmlinux_a
From: Nicolas Schier <nsc@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Stafford Horne <shorne@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Piotr Gorski <piotrgorski@cachyos.org>, 
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260316212930.120438-2-xur@google.com>
References: <20260316212930.120438-1-xur@google.com>
 <20260316212930.120438-2-xur@google.com>
Date: Wed, 25 Mar 2026 10:35:43 +0100
Message-Id: <177443134349.415036.1506063887331719503.b4-review@b4>
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=571; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=jR++UhQwlnzd6tQ1GyMO+/4oIFawypTF5Dxm1zLj5gY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpw6x0/rvVkQEUJ/tO5TepgqoorIVso1ZJNpQOA
 g4MRKedwU+JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCacOsdAAKCRAHUgpwFiYS
 aeVDEADZMN8E6KRDDLcUW0koW04uz43MDa7i+cWO4iRXlV5HywppmYhzEPrleulMxhdLuD19JvS
 7T3fy/YkZX/uOa+wPuV0cWTRGgDjXfT3hShkVnltVldX8nyprv0VyI56Mo87YmoCxPoyQeM1OWI
 DI7f+OQ2H8odwa2MyubsprN3CBIoJzeFp0y8GejAvcxzky3XG09nJCBRkMTAqgsFkrgVacyZgJe
 ZUc5Q4fRCKa+GmAScM70+CtgF+GZk+QxrAQXx87kXUflwvJ+4dkWI+RsrK8RbWjYbcXX0K3z8Kb
 7Cp/EeKQmIkQbv6qfzAKNRnAKqIgnOE52/WowRa6GyPVq4gvCxh8WdE2ebJNce+EMsUdWcwJpMY
 7ycB1pSASKKxMoiQQue5WXNKbAb7kquUE6YryvusarHhd657JWQSPpZpEZxxNzFjnxoZECbO9k3
 sCfrPvSQtXJD0OQ3Zmn1T1MJMhqJs/6d7P5JhDwJsOWtvuCK5z+rQ97YxJ6YThW931jC7dstp5k
 bx8gy1Lp4eAZZlXYmd8pwW/Z0TqESm04iCzZC60+fRa42U3UcEqMzxGELGUdpwPDVO5hBuif+xY
 A3LITeDAV+StjbSVei0CtS7CHhN77ZnMOLxjIiEkFSGqrl+A5d0C4Q8Gn5cGwmJqSvy5YnHcHZa
 SbGNh+mG1n5L/Jg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12251-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38FFC32510A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 21:29:29 +0000, xur@google.com <xur@google.com> wrote:

Hi Rong,

> Move the build rule for vmlinux.a to a separate file in preparation
> for supporting distributed builds with Clang ThinLTO.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Rong Xu <xur@google.com>

As Masahiro's original patch is now being modified: I'd like to add
something like

[rong xu: change '--thin' back to 'T' in Makefile.vmlinux_a]

here before your 'Signed-off-by'.  Are you ok with that?

Kind regards,
Nicolas

-- 
Nicolas



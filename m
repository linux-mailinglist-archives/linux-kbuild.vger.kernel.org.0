Return-Path: <linux-kbuild+bounces-13158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFYbFO3OBWpGbgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13158-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 15:32:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B092C5425BF
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 15:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D287300B76A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 13:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DF43C8C49;
	Thu, 14 May 2026 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQTNszI7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E0532143D;
	Thu, 14 May 2026 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765543; cv=none; b=WNIQjwsrdXIxuFRhn0mI6yXJTgVcjAVvGxygogd3xqN7cYmNv7TW6l4Co4Sb2o1KeXuLgyAoBAtEP6558EEedXF9NASlzrpWnFrLLnNh9hRxF1ECi0MbUc2ySSUBxYnPmQl6/Urb4eyOrElo83PMH2FxUgzkl9iiBKypIGZsdko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765543; c=relaxed/simple;
	bh=tPFeLNKMBAOACGgLfleaYmYYhFazbSdsMVU6DxV3LTk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fuNi5kXbxjfpf6nvCStUxQh7W5lKg+PL6TYbtJ69GQxjviXFHGLKodCBXLSJSWXoOXR6SSi/kDiszlslvBcjSiqbI3PYwwoAUOICyVU5CcpUFkkYfh80X+V8H9bAsjTfdBoolv7tfiuVIUoyLLKMVmqVgiEd931X8Qdi1+a1OAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQTNszI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20589C2BCB3;
	Thu, 14 May 2026 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778765543;
	bh=tPFeLNKMBAOACGgLfleaYmYYhFazbSdsMVU6DxV3LTk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=OQTNszI7pNRJ0ReRA9dU/5n7RxAyVXeUCSqC5EZ4huglJw+LWLhl4Df0iCOqguIl0
	 mdB49/ki3cI95m1I4D27vOyYANDh3ssSUtEKi3iTJneTE7X8khYcQVZyVPvoiLaha6
	 sBZU/QkRdAWAkRvrJQQo6aESh2BU4TcPBN7WtnSlx5r7Rn3aNRtLH8hSTSLONT01C7
	 vbbS6coCh98eoMtmuGpdZ2MBtZqoCkRZvZxU7OveaNqMPPHdZYiOg3agH1E4SbLXAw
	 GvjgJmKzuhBa52gXiw0I0zkWrwRbUYZb27g9s2Vk8baHVPwySjBqTCSEAvmNxEFIIS
	 ByC2q9/mdcRVA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nathan@kernel.org, nsc@kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20260513210329.637892-1-andrew.jones@linux.dev>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
Date: Thu, 14 May 2026 22:32:12 +0900
Message-Id: <177876553250.305249.17848321995033732158.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tPFeLNKMBAOACGgLfleaYmYYhFazbSdsMVU6DxV3LTk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFms556eZn0Qm3CZp3Ljgl96zt8M6i+ovPkft68ha3vHb
 eGwWfuLO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBElD8y/Hd6dNH8dOT5hB7m
 pxWiYZPtFxn2cF/9cNv+xpmX8/L5JNwYGd7zvcxNnF+8ePHEFTktp4rXr98j+VR+8063eXvX8UQ
 XreIFAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: B092C5425BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13158-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,linux.dev:email,kconfig-sym-check.pl:url]
X-Rspamd-Action: no action

On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:

Hi Andrew,

> [...]
> 
> This new static checker is the script used for [1] with a few
> improvements to avoid some false positives.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748 [1]
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>

I think something like this is reasonable, as least until kconfirm
is potentially ready for integration into the tree.

  https://lore.kernel.org/20260509203808.1142311-1-julianbraha@gmail.com/

That said, I don't know perl, so some superficial comments to follow.

>
>
> diff --git a/Makefile b/Makefile
> index e27c91ea56fc..75487383805b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2240,6 +2242,9 @@ versioncheck:
>  coccicheck:
>  	$(Q)$(BASH) $(srctree)/scripts/$@
>  
> +kconfig-sym-check:
> +	$(Q)cd $(srctree) && $(PERL) scripts/kconfig/kconfig-sym-check.pl $(KCONFIG_SYM_CHECK_EXCLUDES)

I would prefer to avoid the 'cd $(srctree)' here.

>
> diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
> new file mode 100755
> index 000000000000..a6907e585962
> --- /dev/null
> +++ b/scripts/kconfig/kconfig-sym-check.pl
> @@ -0,0 +1,93 @@
> +#!/usr/bin/env perl
> +# SPDX-License-Identifier: GPL-2.0
> +
> +use warnings;
> +use strict;
> +
> +my $kconfig_sym_check_excludes = undef;
> +$kconfig_sym_check_excludes = $ARGV[0] if (defined $ARGV[0]);
> +
> +my @files = `git ls-files '*Kconfig*'`;

What happens if you run this command on a release tarball? We should
probably use something like

  find $(srctree) -name '*Kconfig*'

here, which would avoid needing the 'cd $(srctree)' above (although
kconfig-sym-check.pl would need to be prefixed with $(srctree)/ to
ensure the path is valid).

Sashiko has some additional comments that may be relevant, if you have
not already seen them.

  https://sashiko.dev/#/patchset/19870

-- 
Cheers,
Nathan



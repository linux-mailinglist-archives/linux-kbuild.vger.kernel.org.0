Return-Path: <linux-kbuild+bounces-11330-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +9wVNr8llmmIbQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11330-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:49:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D281598CD
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEF9530071C6
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 20:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA091311972;
	Wed, 18 Feb 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkI94K/j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7B1E8320;
	Wed, 18 Feb 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447741; cv=none; b=sGBp4vZqfjYtdTqyrTTb6SQXCn41fqeJBLnK/87kIO6Mw4u/GjZ3Fog31O9nUQB4sJaJs8AgwrPa58d1tnncPDRoNmGGzgpqAjyD8eNiZ04AJwJ73cWBvZAk+DXzFh8jvkzxMYGa7AxnwfCHfnJk1mrN7R2c0V99q/GaQFoOeh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447741; c=relaxed/simple;
	bh=lbYfIBnmrnEFV7yelrf0h4WGBAGd3eyGfhL/lrbRAzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rr5LqNWur6MZDrKrAdkG+1dhZsFsDkR/hOLHLAr0CUHU1vhPcb1toehF1jfyIrUmCqojovtzaK/A+FoBrvIy2ALo2+Oq5eupgyMO7vfGHMHJsL3K1s+GatIubWJHRI1YfBOnnThBLANFeNG2VFJMK3FoYxIgkcRxAcediQyeT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkI94K/j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43574C116D0;
	Wed, 18 Feb 2026 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447741;
	bh=lbYfIBnmrnEFV7yelrf0h4WGBAGd3eyGfhL/lrbRAzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XkI94K/jYhyRQI4XGgeXdB7Ey+V6LaYpNEfIkYWXi+h1v9UktR9CybCR0A1n4aIYQ
	 exrx9n7TAaOtZmS5u9O8UJPOr/a7XxCLPr6TXGJMcJ5CTbPYQJnb70aLIwWqg2eE+i
	 p1M2wZeabzE020zoKDxzzGyUH38G6HeNThf69nUWZ0V73eNMGPuCF5/fC+ttKPkFQZ
	 0Y0sQJAemqXt0CaDfNWQokLbWkmC47iTGzFBX3ouMk8zd0VBqIDLK3e7fzp6dRBSTi
	 6vP6jrMaY5GBJpQGVXyuoEW1WpnOrfmBa9TpaW2LyzyKPQ4r2+WuQzcMxjrSVCG9kx
	 94It86s9YebeQ==
From: Nathan Chancellor <nathan@kernel.org>
To: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, Jens Remus <jremus@linux.ibm.com>
In-Reply-To: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
References: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
Subject: Re: [PATCH] kbuild: Add objtool to top-level clean target
Message-Id: <177144773899.1769768.18400840674852001978.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 13:48:58 -0700
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-11330-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 79D281598CD
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 13:45:22 -0800, Josh Poimboeuf wrote:
> Objtool is an integral part of the build, make sure it gets cleaned by
> "make clean" and "make mrproper".
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: Add objtool to top-level clean target
      https://git.kernel.org/kbuild/c/68b4fe32d7378

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>



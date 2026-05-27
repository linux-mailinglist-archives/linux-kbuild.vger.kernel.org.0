Return-Path: <linux-kbuild+bounces-13380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHewGEB0F2ruFggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13380-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 00:46:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF05EABCB
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 00:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23EF130C2533
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 22:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6EA3BBA1E;
	Wed, 27 May 2026 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsdH9gsk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7A33CAE8D;
	Wed, 27 May 2026 22:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779921917; cv=none; b=DzyIkOD/Na+cipvNkFU5kGP5IEDzZyhdGHcexnw3JB5//ENw+VY4B+DXbMokJ4CU2jU5MJedm0V1F5xU9Xcb1j/xP/xX3SEOtakr55oRE+qLi9RftslmSnhEqpz1x7fXbacOHicmCtQ42d1YmIyiMddSKOt5RNzcx3jfJ2kNstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779921917; c=relaxed/simple;
	bh=LoaVxeQ41yuwtxQsluB1GlemlOtev+LP+NDluPSKddw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YWmlMkBfYq41TfFvwYTS/Gf8lK83Ju3b4s/hrCjwdbV9C6vEnly7CddehrxTyH/46oDrhEq6IAObUpwATAz2CNCIbtak+T8N63skTA3sCxVEJZA9WNsiKmVkAPlQbjawTUr77+fKspmcux2L/WGokTXPpdMbvQsIVjlR3HqDpDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsdH9gsk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463091F000E9;
	Wed, 27 May 2026 22:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779921916;
	bh=h+jWJoW4AWrPDdD9v0CUHhc4cNbgW4oBIRfypHF66Mc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NsdH9gskA3EhUdu/oK8q2qq03BaRhPhITUZUJGhx0QY0S0V5bo20kb8+pO/V+pYdI
	 mX9auynXI7jxkRcnNuWMHXXMNKVcFtS5aElnq1rNYF488CF3VU+73fLPKRBapciR+h
	 Puu1VUnfAfw2qljhioUchTQEwuVbHvd3uDpTtzKocr/I505rByAXXXN4eot8OnC9Qt
	 XGY3w+/Y1ZXEloiYRDu9MIcjUExjnuAUiviDjWYCRlAZd1DjoMH/LBZGVhWmcxWGE0
	 IVAde5M19aduliXUYyxJDv+8CvR0dhMSHi+cffUnfzPdVVC7/EGXZ5afXLtAyYNx9q
	 kvjhkTU1QQ0Zw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] kconfig: add optional warnings for changed input
 values
From: Nathan Chancellor <nathan@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521022824.38591-1-pengpeng@iscas.ac.cn>
References: <20260521022824.38591-1-pengpeng@iscas.ac.cn>
Date: Wed, 27 May 2026 15:44:59 -0700
Message-Id: <177992189956.893622.4881935369487236661.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=nathan@kernel.org;
 h=from:subject:message-id; bh=LoaVxeQ41yuwtxQsluB1GlemlOtev+LP+NDluPSKddw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnixT9ZlDhjDfqe6Nzx4WmcaCe05rC+5O9gx7NurcV1i
 r2GP291lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIn8Ws7wz0A7PkHjgZxF9Kf7
 k9qE7a5HXHnVKVzfNvVwW4JJ2AeNCEaG+evVuRZ+8Lduvv/MoyTx3MqllqfP/rMMZDmsPDWg4cR
 sZgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13380-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A9EF05EABCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 10:28:24 +0800, Pengpeng Hou <pengpeng@iscas.ac.cn> wrote:
> [...]
> menu nodes cannot emit duplicate warnings.
> 
> Document the new environment variable and add tests for both olddefconfig
> and savedefconfig.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

I like the idea behind this patch a lot, as I have often wished for a
warning like this up front for non-interactive Kconfig validation when
updating configurations using scripts/config. However, one problem that
I noticed in testing is the warning does not get printed to stderr, so
it is hidden when using 'make -s'. I think this should be addressed
before acceptance since warnings should be visible with 'make -s' still.

-- 
Cheers,
Nathan



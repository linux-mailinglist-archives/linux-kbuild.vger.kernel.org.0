Return-Path: <linux-kbuild+bounces-12777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCRUFs9O3WnYcAkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12777-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 22:15:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCB3F3081
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 22:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0909A300EC5A
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 20:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC63F393DFB;
	Mon, 13 Apr 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGwX0EvH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1A393DE9
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111305; cv=none; b=CAEShERkIMPlDcpQT/BFcqZ0Qz+k3VXV9cnoixcmsJso2Lg4HHWDcN/hV68cr4h2cXmNPOldRqfBbfpsdRKh6D/9LBEN1NJSzkL80uq/cgQUC6wNdDYaOzmL/fRa+qSRTeKHJvp/ozwxx9R8NxXJSEurQpohulrRYI/UKzIBIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111305; c=relaxed/simple;
	bh=5YFiGbNEEYOp6u0y+93awECP+dREzF/HF1sfbPkYWIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQjC5tqzKRCsvi3dgBOq9drAeMU8iDtp6kW0Lp6vExHljYl9/zBReiS2qgHTtG3d3rCRuNDSvxouVNddvfDLy9k0a3yojgWa7P4Sxi/DD2K7+6iBO413sr8suXrZPXwpaNv2uqUohkVa1JZRNqsxyUYzIIjx925J+sqUgWGUDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGwX0EvH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B39C2BCAF;
	Mon, 13 Apr 2026 20:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776111305;
	bh=5YFiGbNEEYOp6u0y+93awECP+dREzF/HF1sfbPkYWIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGwX0EvHvUp0po3GHlN5XNQltIliBrGAQC5OTVe791uQLXsI705YQUPBHQI85ZVsy
	 LJqisHgX9TpGA6/0kh22yQ+ylq3oZuMoECKG0lYs91roKwsDkjTKnNTHmaanLJDhbY
	 2T3vQjsrXtYwDVqeWSSYrtriM8uPHnXH+EKn+oywH8g3ZBYVKtT4MUWtiQzwt2ZYRd
	 e1gmBrxJWqGOaA7ySmExp7eAzAL6VmTlM7421ErtW71GSZG9Ze83x3dpKZYmu8h9LH
	 1JDDvt6+a+nnj2JzEGreWcC6vN+cmaIQpJQw+Z6EKv8CnS0CstlWJmqt1UoTciq8jy
	 jbHBWFTqgkFpA==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Mathias Krause <minipli@grsecurity.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: builddeb - avoid recompiles for non-cross-compiles
Date: Mon, 13 Apr 2026 22:14:46 +0200
Message-ID: <177611124908.3258056.14591037903837093191.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402145116.1010901-1-minipli@grsecurity.net>
References: <20260402145116.1010901-1-minipli@grsecurity.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12777-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57DCB3F3081
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 02 Apr 2026 16:51:16 +0200, Mathias Krause wrote:
> Commit e2c318225ac1 ("kbuild: deb-pkg: add
> pkg.linux-upstream.nokernelheaders build profile") changed how
> install-extmod-build gets called, making it always rebuild the host
> programs below scripts/ if HOSTCC wasn't specified with its full triplet
> on the make command line. That is, apparently, needed to fix up commit
> f1d87664b82a ("kbuild: cross-compile linux-headers package when
> possible") for cross-compiles. However, in the much more common case of
> non-cross-compile builds this will lead to unnecessary rebuilding of
> host tools including gcc plugins. This, in turn, will lead to a full
> kernel rebuild on the next 'make bindeb-pkg' which is unfortunate.
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] kbuild: builddeb - avoid recompiles for non-cross-compiles
      https://git.kernel.org/kbuild/c/2452dcf4

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-fixes-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-fixes branch in a week if no issues are found.

Best regards,
-- 
Nicolas



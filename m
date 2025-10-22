Return-Path: <linux-kbuild+bounces-9254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EBEBFE4B2
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 23:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D085F1A06FF4
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 21:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58145302CAC;
	Wed, 22 Oct 2025 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq8Tz0yG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5A302745;
	Wed, 22 Oct 2025 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761168049; cv=none; b=XrKO0ApZnB9JF9kahrUc2IjRz7lGz1BRL8kHrvon2dbuZhQ/4Ce5ygNHo8LQOBWQF5oPnaR9Fe3rTF8mw0LNzmg8aAZpuvX5hOcYoWqe5Axh1MwbTdWpy48/dPFFCE5TTWDSG6pR8PXaMqt9jJjpGVh+6CXQoqEcQw7NDZ9HOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761168049; c=relaxed/simple;
	bh=BPlLrrZOu3j8qBw8fv8e82pfHmn4upYlnYlmCL0vH1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/5BoRZRnnTo2188lQXC9hj/d+NrgBYrJpxh7TGXGSNv5ItnL3hDR4bAsVq7sPlJ/92C5OXMff6t1/zXUgHXzsyPsj+TgxCPqW+xgYwA0Vf5iiY87tkHURuPohXCWB2lnH63Yf5GNcuDTS9emzyUjtZAn3VTWDa8C+EoyTxeWQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eq8Tz0yG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A46C4CEE7;
	Wed, 22 Oct 2025 21:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761168048;
	bh=BPlLrrZOu3j8qBw8fv8e82pfHmn4upYlnYlmCL0vH1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eq8Tz0yGxR3AVxbRQIRzTNRStlOHrh5EPhabOa/XSp6top1KlRhKwtSj+YN63R4nl
	 0u2yezrwfa4GWa19zJZmhHhKW24bW5tcOafSyevkOUTh4Kvn9f+jhz+aXLtPmqb5Xf
	 xYaa8/Iv8E4RF4oBfFY0rjjSe3eHY+gBivWsNHQBBDOUQFZ934Sp4B6j0Uq3vUNu1Q
	 tRMwzpqMQTm0nGZeXP5UxtaHOh2WgnptQz6bC9czyjfoaUIXvqyHXO6mohTvJCHZ3s
	 pnkOi7W7yLiaWo2BktH2PHQ3skc0MgUK9fOVZAamgE/zC1sWaNiO/0Y8F7CGuEOcge
	 ST43zvw/ziccw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	mike.malyshev@gmail.com
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Use objtree for module signing key path
Date: Wed, 22 Oct 2025 23:20:40 +0200
Message-ID: <176116758389.2674526.2727622391816025420.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015163452.3754286-1-mike.malyshev@gmail.com>
References: <20251015163452.3754286-1-mike.malyshev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Oct 2025 16:34:52 +0000, mike.malyshev@gmail.com wrote:
> When building out-of-tree modules with CONFIG_MODULE_SIG_FORCE=y,
> module signing fails because the private key path uses $(srctree)
> while the public key path uses $(objtree). Since signing keys are
> generated in the build directory during kernel compilation, both
> paths should use $(objtree) for consistency.
> 
> This causes SSL errors like:
>   SSL error:02001002:system library:fopen:No such file or directory
>   sign-file: /kernel-src/certs/signing_key.pem
> 
> [...]

Applied to kbuild-next, thanks!

[1/1] kbuild: Use objtree for module signing key path
      commit: d30ea149386168d3b1a3fb213523ca6512c07e9f

Please note that commit hashes might change in case of issues with
kbuild-next branch.

Best regards,
-- 
Nicolas



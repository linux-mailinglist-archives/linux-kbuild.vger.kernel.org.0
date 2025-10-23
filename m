Return-Path: <linux-kbuild+bounces-9276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE37C03680
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 22:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 022B235ABE8
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 20:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31815238C0A;
	Thu, 23 Oct 2025 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUu8dFQb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086FF17C21C;
	Thu, 23 Oct 2025 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252081; cv=none; b=nM/4UHmXunwDaTFEU8jC6XNy6nWzgA7kaFQsRA6X7b587gVWmZwbuLxJu+6zaVuK2dqlMcKTP27RRjtqG7qVbRWFqZGaUrzAv8KEwPo2/WjdwtHKhDqn8b2TlJsT/mPhS//MJCRt05VUMPKT7oJFq0k+uMHtQJ86WXO3yOZU2rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252081; c=relaxed/simple;
	bh=Z279D86C5CykmYgQK+XaHbCjGMC+gRtS9m4ttHh7bzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3TZNYQdMlvihgSImDFN3gPplR9lCXuP9r0NwpyLWi9OyB/AXhfx0ieBAB44qzti8AhPgpmb8oOpWYWs5BjUQV4/PteFt4rCQH9WlbHUUchW5MDaiK0xUiWovf9b4OnqwVTfDDO0W6jre8MRHHGKxVZWhNHFUIqPdgBQ0YRwKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUu8dFQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58B8C4CEE7;
	Thu, 23 Oct 2025 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761252080;
	bh=Z279D86C5CykmYgQK+XaHbCjGMC+gRtS9m4ttHh7bzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUu8dFQbhuZpByWuxDJcQEPi6leL9Jq13x0u+/PGh4+N5xD9VXT9bEzy0tTClQIcp
	 QMiuD7vK78CATHacjmuSsACi3kkY9TvwRdyFgbgxdYWJyiWseoQ1cKjRw8G12RkU1E
	 CJbwTyh42n2xCeuYaozhrettHtRz1vTG9wySd+GZY+aWCIX4kPp8r25TvnvgQwBRzV
	 jxXNxubRPnijiqMRHNUZZ8erk+2CqIcxLXgGLnjWTBoVjfyuMKMtLjeyeFaIK10FW6
	 JvIQ+X0v6BdQu4g3ER5VSqM2BymvueCZaQnlfF1rAxK/RoIv3mrhXxvdzTFo8oPAPy
	 H8i21P0i03b1w==
Date: Thu, 23 Oct 2025 22:41:17 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Kconfig section
Message-ID: <20251023204117.GA1279951@ax162>
References: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>
 <aPqIM40N-2YBEmVk@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPqIM40N-2YBEmVk@levanger>

On Thu, Oct 23, 2025 at 09:55:31PM +0200, Nicolas Schier wrote:
> On Thu, Oct 23, 2025 at 09:25:20PM +0200, Nathan Chancellor wrote:
> yes, that seems to be best for now.  Can you please use my @k.o address?
> 
> M:	Nicolas Schier <nsc@kernel.org>
> 
> Acked-by: Nicolas Schier <nsc@kernel.org>

Ack, do you want to send a separate change updating the Kbuild section
(and maybe .mailmap if you desire)? Does not feel right to put it in
this change.

Cheers,
Nathan


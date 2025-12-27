Return-Path: <linux-kbuild+bounces-10344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED0CE025F
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 22:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5952330036E8
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 21:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB2426CE1E;
	Sat, 27 Dec 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCposO/c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B3265CDD;
	Sat, 27 Dec 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766871567; cv=none; b=IaNFAHv1JXGS9vpoBjS/LW7uayt8d+Joj/bnbPSIKIMBqANcy7tZWemhYeh3K+OmQAF2ZEmBmxpx7WQnDWUwnQ5h8jcxEgTK4jXSiFDN2rhNjyKoU9SN4gOCT8puI8y80mZF5MZDtaN/B382yD08hLk+MMddDnjRQADvCKHZdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766871567; c=relaxed/simple;
	bh=rDaOu60HTWqiLMnVfWELTmuZDGIdOup3ai2pplXrZpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fylGNOnox2zNG9Uq66YIzuhBPuu0F3n6kJdB5NNTZFY4Y76oN3AQyCzcn2pARdBkWW3NiqSmJrRJCJsf3KAZcTLwAiMoXNXyaNqkwCPpz4HYOiCW7D6lMBacsfb8glEOr1dWpWc8bVv6qegDNLef29qLqysYTvvfm8WgCdbigp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCposO/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DBEC16AAE;
	Sat, 27 Dec 2025 21:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766871567;
	bh=rDaOu60HTWqiLMnVfWELTmuZDGIdOup3ai2pplXrZpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OCposO/cipBRZuwqMbISfgHnUzf9TcS6+5w6cQ5IIsKFYsEcKnMw9VzhAwX6waEit
	 TQec3o0zPFqMvAlhA8EMngQi7n1cU3dxBRKie29MPLgd7E0YdoDCiTX81zn+6JHStr
	 PbVmynpMEJSeKRMaH7T3fFnxIqLjDIRMQrPin99l8VvDWJhSd+Eklsy/qwv3uKfjw1
	 v50ZnaqIF9sTjtpiYZIm2tnWgfpdiCjpNO3/qX9QxEeCEgXaf5fNfiWAM5+/eo4Lcz
	 0dh2Su1GmN1hx2QUxpduoT4D8TZ3QpIqCvRCLvlxSshTmrkytVJ2jLnDkGPK+/HtgT
	 hqUFZVgJZoJgw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH] Revert "scripts/clang-tools: Handle included .c files in gen_compile_commands"
Date: Sat, 27 Dec 2025 21:10:12 +0100
Message-ID: <176686408087.98851.18001317531307257371.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217-revert-scripts-clang-rools-handle-included-c-files-v1-1-def5651446da@kernel.org>
References: <20251217-revert-scripts-clang-rools-handle-included-c-files-v1-1-def5651446da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Dec 2025 20:13:43 +0100, Nicolas Schier wrote:
> This reverts commit 9362d34acf91a706c543d919ade3e651b9bd2d6f.
> 
> Dmitry Vyukov reported that commit 9362d34acf91 ("scripts/clang-tools:
> Handle included .c files in gen_compile_commands") generates false
> entries in some cases for C files that are included in other C files but
> not meant for standalone compilation.
> 
> [...]

Applied to kbuild-fixes, thanks!

[1/1] Revert "scripts/clang-tools: Handle included .c files in gen_compile_commands"
      commit: 07fe35b766a6fcd4ec8214e5066b7b0056b6ec6a
      https://git.kernel.org/kbuild/c/07fe35b766a6

Best regards,
-- 
Nicolas



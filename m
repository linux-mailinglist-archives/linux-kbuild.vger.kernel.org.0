Return-Path: <linux-kbuild+bounces-5561-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B40A1DCFA
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 20:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBEB1163C7D
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 19:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C75194091;
	Mon, 27 Jan 2025 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfNGo5i3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4631917D6;
	Mon, 27 Jan 2025 19:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738007648; cv=none; b=rVTMz6ZSMb1eweb5joJBxdJRznI+Vv/HZj2KakCHauCggG8AjdPzQ0rdhyNAGfXLlvy/6QCdqMNCFHpWQ85ahJ699v7XQn2PK57szrTCLoi4QnQYe5d9MlC9/QcJJiWWfg2gEvPBDvO+ZA47v4jDOiwwc4HpMWVnHZlj3sUo5Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738007648; c=relaxed/simple;
	bh=RsEV8MWT5Xmlx3jnrE7GA6sjPthNGl/SRLLOmHG/kFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvyMRc8O9uzKbKgFrTmhKVSdfi21CjZu3P7c2zKUGrWZgTlVfSxFGt9EE9nvpTxpHV1gGSgjZl+k4Ea4LLclDzka/txWNqBBNHX78xq4Y3hAv7ELca0hDuH2Wy3FNfZSdiKQv3iRe9yHmSNeE3ryQtQ68x/YtC6pew00GoyH1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfNGo5i3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A117C4CED2;
	Mon, 27 Jan 2025 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738007647;
	bh=RsEV8MWT5Xmlx3jnrE7GA6sjPthNGl/SRLLOmHG/kFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfNGo5i3HYl8M5ezdVg6BTafxQOazBAG87ufYk6TGg6AVj3milu6M5nMRqqDrJk0o
	 3m7WLRfPN/a8mhJKXl9b1zf2Sci9BJ3P7fMVHf5V4Q8j1EhTx6Mmdc/5a+GB/mZvf9
	 WRGn9p3vJVxjVrhbh/tV2NVR5vkhDb/znw3PeAOj8a/5TKTVzcSZK5nPHY8hRLuuWx
	 FQCDafUtZlqFeqDTLLCPk4vi9XfWBtfXCFsS/FHw2jIa0ntnkYb4YCpsmtPmbp3FFh
	 YeH3Juvttju6UPx7UuKaEeEgkTWD2Yi822HR0NXUEODQGJiZH4wvuS8qI9UbjzJWL+
	 os4m9zDCYUABw==
Date: Mon, 27 Jan 2025 11:54:03 -0800
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jakub Jelinek <jakub@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] kbuild: Use -fzero-init-padding-bits=all
Message-ID: <202501271153.30E781B71@keescook>
References: <20250127190636.it.745-kees@kernel.org>
 <20250127191031.245214-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127191031.245214-3-kees@kernel.org>

On Mon, Jan 27, 2025 at 11:10:28AM -0800, Kees Cook wrote:
> Clang continues to fully initialize these kinds of variables[3] with
> additional flags.

Typo: "with" should be "without". I've fixed this locally.

-- 
Kees Cook


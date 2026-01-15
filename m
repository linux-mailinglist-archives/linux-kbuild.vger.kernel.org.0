Return-Path: <linux-kbuild+bounces-10592-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E5D22543
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 04:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC7943026292
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 03:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11B9289378;
	Thu, 15 Jan 2026 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfIEQeS9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEB22BB17;
	Thu, 15 Jan 2026 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768449054; cv=none; b=m9zms4B2/wp4ffrYV5nzpvESPCGmErUou41exZDttcvnL2L6XPWIsxz+upjauh2v/qqrt5em91PBbWN7YuG2ZA+GgHzqdZiKuc6zhuQ+1BwDvdjDBPzqxkd+sJR+K+JDWsv7F3Slne8ZjZ1D22Rm23A37OlpaFCwMyH8OUqDA48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768449054; c=relaxed/simple;
	bh=UC4AeQ8AxgesO4+xkiFefzNB5NY2nFsLbKSvuVs7rDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUX7L8a2r2AYp65TwVIIOyzywMPxcHRmKkaRyE2ysPD8edRnwyt7P3CoiXZuejwZPkOcpCuSEp+fNUwtoupaYrVl7jxrDb50/oZID8X3yYMB97owjJh9mLKyZCfJ8xjZ9W1tqOplJqJgVv+iASQTma4uuzmsxQs52YVhOTpDeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfIEQeS9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E11BC116D0;
	Thu, 15 Jan 2026 03:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768449054;
	bh=UC4AeQ8AxgesO4+xkiFefzNB5NY2nFsLbKSvuVs7rDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MfIEQeS9XYK10vF4eK2C3dIdppfxqeHk4NOt2ghzc+LyyRHjXnG2oiSvKGHdRqEkx
	 MtU15902nGES52mNLyIDHxtOlz5N0oB68uDyNuZj8oXuoPikkW9UUwh9hOG5qBKOwY
	 ygFCmjF0nkQmOZxkvmy9nQnTDMYWMJtOvAauAE0ji+Fw6ihka/rt665n1zG0p2saXZ
	 VjmQrqftFTPHGyAVj5lHtBw2VPAqr3fXYvnUO91nDur5MP4ZQfId0L5MklIL4Fwpkm
	 e1bi08M4MGrtAtHZLhVGenxpeqRmGuS23S8GfZPXQVdjxlPc/107G79z4ICyK84AnA
	 /RBPbHIKhHTGQ==
From: Kees Cook <kees@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyuli@aosc.io>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 0/2] fortify: test_fortify.sh: Improve handling of tempfile
Date: Wed, 14 Jan 2026 19:50:50 -0800
Message-Id: <176844904857.2648728.17739404164270415706.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114-fortify-improve-handling-of-tempfile-v2-0-63b86c4dbd0e@kernel.org>
References: <20260114-fortify-improve-handling-of-tempfile-v2-0-63b86c4dbd0e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 14 Jan 2026 14:57:13 +0100, Nicolas Schier wrote:
> WangYuli reported [1] that the temporary file created by test_fortify.sh
> is recognised by git as untracked file, especially if it remains after
> non-common exits of test_fortify.sh (e.g. killed by signal).
> 
> The following two patches handle that by renaming the temporary file and
> by cleaning up the file in more situations.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/2] fortify: Rename temporary file to match ignore pattern
      https://git.kernel.org/kees/c/ccfe7d6251f4
[2/2] fortify: Cleanup temp file also on non-successful exit
      https://git.kernel.org/kees/c/9f54ab83cb2a

Take care,

-- 
Kees Cook



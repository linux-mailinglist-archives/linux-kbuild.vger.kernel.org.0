Return-Path: <linux-kbuild+bounces-9287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8AFC119CA
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 23:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43177351997
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 22:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B582DEA6E;
	Mon, 27 Oct 2025 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGRx+0/c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4F2D7812;
	Mon, 27 Oct 2025 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602757; cv=none; b=KTXpH7CNxq9ZJIHWj5wb2rIc+vGperXSa3jyJCdUdBp9tTaTC0akImYgR6cd129Gji53Cfi+DBemI0LP1HW5J83uf0kweQBHo+ha50718rE25zNZQ43hFwd4whDGNc2MMdaG3mnwnPVhB4eVLwZDHiUWrdfj55+ucJeOg56wROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602757; c=relaxed/simple;
	bh=EyofFY93wEmVtXlRNNpyxNrYbhM/v8u+7j/Yi9zS5zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHE5/rgp74YP0OGT9pYJyyYRJD+YtRUB1pgQWEqlJrzy6Smee7yJbLFgZwRDU7VM+hZojI4o+D1PwzEkafNUYcmDxzkbZ9JGhdhyIADJ/6KV4kUkhBweZQ5bJ0kuarJZjZYbkz1nDlyZFsPlrXqZZJtt7R8H6sIvUZcn/ijdjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGRx+0/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEBBC4CEF1;
	Mon, 27 Oct 2025 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761602757;
	bh=EyofFY93wEmVtXlRNNpyxNrYbhM/v8u+7j/Yi9zS5zY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGRx+0/cy9/fBllNHdttqaQ6k0Mq+EDdyCoV6OFWiMO9LwIcoB55Yy6HW2tgz0cHa
	 092IefAZlRXbSpgjU4SnwR3YzjVlTR3qKQRH2B1F4LeRksKKsEG408JnItpVKwpgUy
	 bFwZkVEDUFqJCd3ZNPaSmfI3HgWHAv47KRTpkZen0wQVGQ0MuT5oNgz/6RVzDmPl6Z
	 hSsCmTE1rUBqT/VKEfplzAzNKXirdSohpq3M0O+szq81I3pDh+kDHAVPg03ciyh+0t
	 Iwol0A1ZMJjLjEPILMWLAnZMZmNWMiPzWMAm3w+igOWBcEnI4iADjx99lsOlkQvlZW
	 WD/Plz1zk6ZIQ==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: uapi: Drop types.h check from headers_check.pl
Date: Mon, 27 Oct 2025 22:59:29 +0100
Message-ID: <176160225482.2834943.10196317041300510391.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023-headers-pl-drop-check-sizes-v1-1-18bd21cf8f5e@kernel.org>
References: <20251023-headers-pl-drop-check-sizes-v1-1-18bd21cf8f5e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 23 Oct 2025 23:51:29 +0100, Nathan Chancellor wrote:
> Since commit d6fc9fcbaa65 ("kbuild: compile-test exported headers to
> ensure they are self-contained"), the UAPI headers are compile tested
> standalone with the compiler. This compile testing will catch a missing
> include of types.h, making the types.h checking in headers_check.pl
> originally added in commit 483b41218fa9 ("kbuild: add checks for include
> of linux/types in userspace headers") obsolete.
> 
> [...]

Applied to kbuild-next, thanks!

[1/1] kbuild: uapi: Drop types.h check from headers_check.pl
      https://git.kernel.org/kbuild/c/c260df04

Please note that commit hashes might change in case of issues with
kbuild-next.

Best regards,
-- 
Nicolas



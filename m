Return-Path: <linux-kbuild+bounces-10343-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1390CE025C
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 22:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CA243014AC4
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 21:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B5F24E4B4;
	Sat, 27 Dec 2025 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQR3LZRT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF81D5ACE;
	Sat, 27 Dec 2025 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766871565; cv=none; b=mLlE+GtA/LunqVTy8WtDvJz3qwpkohZn8KM11wHKUGgK68Xe/+XqaQXW1s6qnal9sa55aEH+UxE416C2jo0SS24BV8V/F12s9S8qhG0SLUPqPga5CVRWcy5gz7HV9+TcmyVZvlOrfRKVHfc3wy/9GSwow7nqkjMJEIlJQrp+1xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766871565; c=relaxed/simple;
	bh=b+CbMrpFxhtdbh9PiyjaYoRjElwG9hY5VQ0QVpIj/2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E+r7a/5Dvwd6yBjJuo4RB9bW3/5uqqpN6EKDako4qrU+R0FD4i8bjmn7J6DHv6LqGUplm3wAFw9y/42jgyOcISJ6VikQEtZO+nOh3bCRulzANHpilSUI06SOc/8Fy67AzoLdtxQEHQdRLr8151tZKnu+G61VbKUND9stUBl8ML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQR3LZRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D73C4CEF1;
	Sat, 27 Dec 2025 21:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766871564;
	bh=b+CbMrpFxhtdbh9PiyjaYoRjElwG9hY5VQ0QVpIj/2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FQR3LZRTAB5DuXCl+hz4GqrQXt/o588Sts/PjongmbXr/FnXg3d3e/OHV+y1AcUi0
	 bTSy7gJlWtAvIFAFpfSvzep34WlVZcS57YVHCmUafuKrlTB57GzU6SueT4F4sPkXfR
	 9L3cS67fu1bj03ZiyzcV9QTNbuHcY1O+fJJhMtYMitcIbNHNnYw5wKDy2sAa5so+Mh
	 NXD7qjQ7i3vZsUPorJdgZ1HzOvU3XE9CzOBdi7JveNs18RCXyoEMby38mQ8B+uCNZZ
	 38mx+NyJQ9V3lxyGGJOePAPkTSkQWaE7qeUBbO0Bcb8DXL3gGTPYOLnjk6R3u2kG5w
	 j1gUMweU/AN4A==
From: Nicolas Schier <nsc@kernel.org>
To: andy@kernel.org,
	krzk@kernel.org,
	linus.walleij@linaro.org,
	nathan@kernel.org,
	gregkh@linuxfoundation.org,
	bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org,
	masahiroy@kernel.org,
	legion@kernel.org,
	hughd@google.com,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Subject: Re: [PATCH v3] mcb: Add missing modpost build support
Date: Sat, 27 Dec 2025 21:10:11 +0100
Message-ID: <176686408097.98851.3631406135184697169.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
References: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Dec 2025 09:42:00 +0100, Jose Javier Rodriguez Barbarin wrote:
> mcb bus is not prepared to autoload client drivers with the data defined on
> the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
> 
> Add modpost build support for accessing to the mcb_table_id coded on device
> drivers' MODULE_DEVICE_TABLE.
> 
> [...]

Applied to kbuild-fixes, thanks!

[1/1] mcb: Add missing modpost build support
      commit: 1f4ea4838b13c3b2278436a8dcb148e3c23f4b64
      https://git.kernel.org/kbuild/c/1f4ea4838b13

Best regards,
-- 
Nicolas



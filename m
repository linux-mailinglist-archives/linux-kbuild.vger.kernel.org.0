Return-Path: <linux-kbuild+bounces-4907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 573829DB2C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 07:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD352824E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 06:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6901422B8;
	Thu, 28 Nov 2024 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="ZLmT7B9l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0317C1FAA
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Nov 2024 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732775393; cv=none; b=LM12IbY3Bk7Jj0TRjVWvIV5mU67YoMatdzvPLnrOrKrHL0kjYY1Q7ahhk9GHfs0XHRCuX4IIF7R3mEA+vRTv/ERTxp7lh2N25XsC/q0/YGmPJAQqhOgKX2QJZtzGSHuUmlNGU9E3JzeGD4JdvPCSqyNlmPibMmLHXNHUbROUJeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732775393; c=relaxed/simple;
	bh=ka8Liq6AUQh5dYatRrra2xalal0E1n7zulg/FMN/k2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAuI8nO0axXFlSM17b9nknRzQ4iV+zvoLvO1/2/AetuwQQNQ8JsurgwWjhsTNqqW8fSNFVQpyqmysFSJOZjns6rxZ0TnAAa88FfNekXhWagpfGoROu/wwYy9U0NiI8Xg9BFT3sN3x6bWlkkf35SjE6x950yr73KEhMuiUtr4GIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=ZLmT7B9l; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (unknown [37.4.230.225])
	by mister-muffin.de (Postfix) with ESMTPSA id B1F20BE;
	Thu, 28 Nov 2024 07:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1732775388;
	bh=ka8Liq6AUQh5dYatRrra2xalal0E1n7zulg/FMN/k2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZLmT7B9lnMTKxPf6nlSFS4RXTn2dmXyxn2v36WGdEQyOnzi/7HEBZx0k/jEYuXkuG
	 yaFjGuRwD3r46GHTVB+uuxdEvTU0/LX0wm0mbKP15S/g8traDrqS9VlQu6MTJy18v2
	 i8z/td8sXQiu5OAYpH4xUy1DMJMlf/L8R+uMW63s=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCH v2 0/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
Date: Thu, 28 Nov 2024 07:29:39 +0100
Message-Id: <20241128062940.1708257-1-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com>
References: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Quoting Masahiro Yamada (2024-11-28 02:38:40)
> Signed-off-by: is required for any kernel patch.

whoops, you see I'm not doing this often. :D Thank you for your
patience.

> However, the added complexities look skeptical to me.

Yes, I struggle to find a good balance between the problem that only recent
versions of run-parts will support this versus trying to be safe and doing the
best we can if things go badly. I think this new version is quite a bit easier
to read.

> If /usr/share/kernel/postinst.d/ exists on the installed system,
> we can assume run-parts>=5.21 exists there.

But what shall we do if it does not? My new patch falls back to only calling
run-parts on the first directory (which will be /etc by default) in an attempt
to not leave the user hanging. The assumption here is, that distros will
probably want to only allow packages placing hooks into /usr once a version
of debianutils with support for this made it into a stable release. This is
still a while off. This means, that for a long while, all the important scripts
will still all be in the familiar path in /etc.

> One more thing, do we need a new env variable
> for the second search path?
>█
> If a user wants to add more search paths for custom hooks,
> they can pass multiple words to KDEB_HOOKDIR.
>█
> export KDEB_HOOKDIR="
> /home/masahiro/etc/kernel
> /etc/kernel
> /usr/local/share/kernel
> /usr/share/kernel
> "
>█
> This is compatible with the current "single path for KDEB_HOOKDIR"
> usage, and flexible enough for the new extension.

Okay. Indeed adding the home directory or /usr/local sounds like valid
use-cases to me. I am a bit hesitant because this forces the paths to
not contain spaces but I guess that's a reasonable requirement to make.

Thank you for your review!

cheers, josch


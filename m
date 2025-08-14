Return-Path: <linux-kbuild+bounces-8479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E0B27182
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 00:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 611393AF95E
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 22:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39FF25DD0C;
	Thu, 14 Aug 2025 22:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfgEIOog"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910C1319873;
	Thu, 14 Aug 2025 22:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755209832; cv=none; b=gFQz1WSE858kktAPOj54IMT4LWpAQp71dgXpdpRwRKm43h/j+wEtG/O2yP1CmWQ2epEzOJYBJPLO+pN9PbQ/gOB/yPhA86x4eZUhX07a/fY8vlGXxPmE6/vlv0DTCpotEIeE5q63w7UWewd9I6EXXXRqTPRQfrjrGh8ZLeSz+Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755209832; c=relaxed/simple;
	bh=aSc5vIIoQsAueHjH5bF58EokT80rr3IpA5ugwyr7Ook=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DSkTNz7oaj+6r7A7he+hjvQiyVvP/5+wPCfI5O4BWqIgJz7If8HntOhy6X4ey8/3gtWG7dZSen0v9c5ER+B0sOHnAULzKCBTTT5a3Vdj9VPiBECLGTwRI0xjz6DxI8CeDedD7ClSrzjka0iUVTuEzh1BYFcVIOci2FzkN6sTNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfgEIOog; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BEDC4CEED;
	Thu, 14 Aug 2025 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755209832;
	bh=aSc5vIIoQsAueHjH5bF58EokT80rr3IpA5ugwyr7Ook=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=CfgEIOogNaOu87OFC/4Mk2HfCKtM8fM+jPZzBhiMLDjvzVURv9r5jvYoxJHb/phyY
	 gHjSxhFA3fRyOP3H90sxxV9+yxKD22kgQwvgpe6r3LKVU7OR8ufYbUYS7BU72Udm/i
	 pKMovl0pwxk1fHiNL5nDh0XmyV6XWXMYfCBPSL6M5mg3yXahuGrM2zqjqDJ94xq9jH
	 jWy6hD7BiyqD/tKsdhoXUMeIYIeP/9U0E+sBfEUzZrKFzd9UGVmXHaShunwB2qGJsR
	 D4zdJxOJtCaaKPrvfmqWw8zS2enQAT0l0i5G9fo/xMDbcZmQQ+61Hbh6x7uYD3SIMz
	 ttSgMQTm4r4AA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Aug 2025 00:17:07 +0200
Message-Id: <DC2HYF56GPWI.2EIEHWAGVK9AI@kernel.org>
Subject: Re: [PATCH v6 6/9] modpost: Add modname to mod_device_table alias
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Masahiro Yamada" <masahiroy@kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Luis Chamberlain" <mcgrof@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 <linux-kernel@vger.kernel.org>, <linux-modules@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 <rust-for-linux@vger.kernel.org>
To: "Alexey Gladkov" <legion@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
 <15724fb8669dae64e3c8d31ab620f977984b2177.1755170493.git.legion@kernel.org>
 <DC26OG2L7OMH.31RE7460D4DHU@kernel.org> <aJ3qsonmvUUErQx9@example.org>
 <DC27G409IQGT.H9G83QDQ9V7R@kernel.org> <aJ5ZMJC4eCpDb5D8@example.org>
In-Reply-To: <aJ5ZMJC4eCpDb5D8@example.org>

On Thu Aug 14, 2025 at 11:46 PM CEST, Alexey Gladkov wrote:
> Again, no. We need the entire symbol to be unique so that the linker
> doesn't complain. In fact, this symbol will later be removed from the elf=
.
> It is only needed for the modpost utility.

Gotcha -- I think I got confused; for the device ID parts:

Acked-by: Danilo Krummrich <dakr@kernel.org>


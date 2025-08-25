Return-Path: <linux-kbuild+bounces-8581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21AB347FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 18:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D78417EE45
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BCC301470;
	Mon, 25 Aug 2025 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niznLedp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE122797A3;
	Mon, 25 Aug 2025 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756140982; cv=none; b=fhkZCH1Lt6gGR3xz7bQWWCaDlA5pbP5K1Ee/QbEkinxIbtigb6ho4sw3odCSj00fs+jXkNRYXd2HMKcezNPQmT8uCQJsk4+xDlP+IiPCvYHWXtQIhRg2cmzl+1j3wJiu0kjx1SmxKPfyQ/wPjbAcbX4QM/Bwbsr0bysLL6cMQCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756140982; c=relaxed/simple;
	bh=89pAMnnIjnYgTZQ0jG4cjiydp0Dvi6XaebY8MqwpF9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgqjXrWod+fO8m0Nw9hEEDPCziXREtI9ILcA/2mVwewdl9dbbYClhaVNSRzj4FFZXNXYq1g3gmJKQb/BchN7NuP7agOp9QkqKwe/lK/UPU1UqI8MXqdbl0lAGNzFP7kRxsfgNlTXNBgIJ75dC/1d6o7nxuEqjCB5LAnNMJbWVAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niznLedp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27052C4CEED;
	Mon, 25 Aug 2025 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756140982;
	bh=89pAMnnIjnYgTZQ0jG4cjiydp0Dvi6XaebY8MqwpF9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=niznLedpzafaj+v2tAmTYzEhJQkX6b/EyRgL2YV3yEzufJlqrB8bT3YtKk6zz8apR
	 R0K20S9Pf3psslinvr3Z7Z1mCI0vG3uQM4BSmEb+ucUd2JnrGRgBFBbcMAwcrwZZpf
	 SM5v91K1vvtfBs9em7VDz0cv8MQqsEHMtdn5FSQo8rL4Xso4Wvst3szJpRylVFFhJ3
	 ChamDk+7EXvuBVeykHbiuqCMX1ChH/0cYiA28f6DEDCfAGJXWzdBjD03vE8i1JzICU
	 SMWeCNIZDnoYkHYdi8cNzY8fujgKQpi5BVgOJ/+XTE1OYFnhKuFH5Y2th61LrDTtfC
	 8oBTVxmsFj90A==
Date: Mon, 25 Aug 2025 09:56:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexey Gladkov <legion@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Khalid Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v6 4/9] scsi: Always define blogic_pci_tbl structure
Message-ID: <20250825165616.GA2719297@ax162>
References: <cover.1755170493.git.legion@kernel.org>
 <93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
 <yq1v7mkxe2h.fsf@ca-mkp.ca.oracle.com>
 <20250819071817.GA1540193@ax162>
 <yq18qjeyd4a.fsf@ca-mkp.ca.oracle.com>
 <20250820161142.GB3805667@ax162>
 <aKw2bKTjmHBGjxt_@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKw2bKTjmHBGjxt_@example.org>

Hi Alexey,

On Mon, Aug 25, 2025 at 12:09:48PM +0200, Alexey Gladkov wrote:
> Has these patches been added somewhere, I can't find it in kbuild?

I plan to apply this to the kbuild tree when [1] becomes available in
mainline so that I can backmerge it and apply the rest of the series on
top to avoid build breakage. As it is on a fixes branch, I would expect
it to be there by -rc4 or -rc5, which still gives us a few weeks for
soak testing in -next. If it is not there by then, I will just apply the
series in whole and we will just end up with the same commit in the tree
twice.

[1]: https://git.kernel.org/linusw/linux-pinctrl/c/bd7c2312128e31d056d30d34d60503de056e15f0

Cheers,
Nathan


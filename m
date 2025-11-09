Return-Path: <linux-kbuild+bounces-9462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A0BC4378E
	for <lists+linux-kbuild@lfdr.de>; Sun, 09 Nov 2025 03:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 976D54E23E4
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Nov 2025 02:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C727E1E9B3A;
	Sun,  9 Nov 2025 02:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hs7wUto7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB6134AB
	for <linux-kbuild@vger.kernel.org>; Sun,  9 Nov 2025 02:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762657032; cv=none; b=LN7fppVT1kjpk5M8BfNrgyvlZjRZxo6juf9Ql0WIayOgczcAhUWMNF0NkEOnC+suWdn7j7CeBZSr3SRAGxqL+GAsnCDUWOSKU6Mv+gNu4aMTGux2INWWQSitdgZsiGhwm7+ZNMgzxVfDGhJOWw1Z+k++mMLfcW3Lj0b36v7gehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762657032; c=relaxed/simple;
	bh=+tgfNMmS1oJky5Z0FxsACq7MTQSTJA4tmJgN48mnhx8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sY9tNxSRynMfguVsawHOMzlxaCq+EOklAE27n/A7NomCuwxdnFEVXoUAdKXMLtOCETLEgVRmd4/mhm9TcOrk/9ask6rr4XsMXjLAx2XCHD4+JweSeiMfovlkhoBZ5eV1gVIlt5qGuORm6ikypq6ye6dzCNBnR4yo+R/Q7jvHrfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hs7wUto7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227F1C116D0;
	Sun,  9 Nov 2025 02:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762657031;
	bh=+tgfNMmS1oJky5Z0FxsACq7MTQSTJA4tmJgN48mnhx8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hs7wUto7Z12zisq1fh0vOtuBXl+KZTjm/0GrKM/j2C7OzNG9vWF2dWQHP3Lx21+gE
	 K5q9tb8wxFe63Tqp3zaZobrqnaZLfmKzwATsXSnD+c6FhlpoVNg/8iWqyUiMfcMfOK
	 W9qogE9OyIN225qE+IJLVBDmlaiNw9nRrPUCHD+5M7Q6MIq3E3VFnSqPglzP/HnaZH
	 P/pMmNa+8QWuTNBB9Q8Y1eTI5z8abZhu92B6tVfKs6shW9JYHhazRBeKRhRK943syr
	 4udmi6iOOJPkqBFXkbvGqCJWTu7bqaZw84SSNSAP1BWwcKHoUW7xJTKC/aHgHa2+YA
	 AUVTaTGdBqkTA==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
In-Reply-To: <20251107192933.2bfe9e57@endymion>
References: <20251107192933.2bfe9e57@endymion>
Subject: Re: [PATCH v2] Makefile: Let kernel-doc.py use PYTHON3 override
Message-Id: <176265702988.2542357.8614051216639060311.b4-ty@kernel.org>
Date: Sat, 08 Nov 2025 19:57:09 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Fri, 07 Nov 2025 19:29:33 +0100, Jean Delvare wrote:
> It is possible to force a specific version of python to be used when
> building the kernel by passing PYTHON3= on the make command line.
> However kernel-doc.py is currently called with python3 hard-coded and
> thus ignores this setting.
> 
> Use $(PYTHON3) to run $(KERNELDOC) so that the desired version of
> python is used.
> 
> [...]

Applied, thanks!

[1/1] Makefile: Let kernel-doc.py use PYTHON3 override
      https://git.kernel.org/kbuild/c/002621a4df3c1

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>



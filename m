Return-Path: <linux-kbuild+bounces-2534-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E9931819
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 18:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 848011C215D9
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE481BF24;
	Mon, 15 Jul 2024 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPERKn81"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0131F5F6;
	Mon, 15 Jul 2024 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721059657; cv=none; b=tThlGZgOaaFRgDZhlGbwQtiFQeFxbloeSHvE49abMVInT/l+F/tUofYsl3NNQ9r/aJOFCJrejyXUENsWMUUYUNm7B6ZhYlD5sYJE33CgHQLD7jE1CDbNrUNq7FUObEXR48Kyub2pKCJ0GXLABI0LgmfJT+nDxLLM7zZ3WEycdkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721059657; c=relaxed/simple;
	bh=TehSUkDWxfnL7kQYd+Ih+VXqWzIBZClmsW2uHfvyxGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIGLwNbU9fBSmrX6uhJqcPVwyo8/530ycNkqCEqhwc7Gmfwdm+t5EGQTkzbK4PhZUs4wJq6MQo8GLpAbEUMxLzQrsHydLibTiZVNTWlJhFfciS+rCje8LGhsiTM+ysH/puzoqRn5RfD4ZeWj7SzhusXa6QiruhwGpZwTdC5f2e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPERKn81; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2268BC32782;
	Mon, 15 Jul 2024 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721059657;
	bh=TehSUkDWxfnL7kQYd+Ih+VXqWzIBZClmsW2uHfvyxGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPERKn81rjAv/MZSjnHkKnRwfPwuwuz7PJsceZNNZXc1zLH9WftBjQ554TAHAz0Vx
	 7rS8C8oZ/dWAESUUxxMqeZY4DhGbZtjDRaIVGXE307/315kkr7AGSGmJltVZ+p51Mk
	 rr/gch3QM88LHhmPeTbNDksR4GgUC4aQ6jNqSiEPRH68aF6aW4Hdv3Dn0AVvnkj7nl
	 RBnqzUcuBIXL/79f7jYAU1sz6IzA8NET+S5QSAUKgGSjOEyFkhbrbbhHyrJvI66mf2
	 B8IOKuPscDH/pOPKYkmnfIp0cTKULq9ewLLIGPnai4Gz1nbNh0p35wLmGKoO+JFRGG
	 radx6vRhvgpcQ==
Date: Mon, 15 Jul 2024 09:07:36 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fortify: fix various issues in test_fortify Makefile
Message-ID: <202407150905.56BBE11@keescook>
References: <20240715144529.101634-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715144529.101634-1-masahiroy@kernel.org>

On Mon, Jul 15, 2024 at 11:45:22PM +0900, Masahiro Yamada wrote:
> Applicable to v6.10 tag.
> 
> 
> 
> Masahiro Yamada (3):
>   fortify: use if_changed_dep to record header dependency in *.cmd files
>   fortify: refactor test_fortify Makefile to fix some build problems
>   fortify: move test_fortify.sh to lib/test_fortify/

Thanks for this improvement! I will take this into the hardening tree
after -rc2, unless you would prefer to send this during the merge window
based on your tree? (The fix you sent for the v6.10 release means my
trees based on -rc2 can't apply this series...)

-Kees

-- 
Kees Cook


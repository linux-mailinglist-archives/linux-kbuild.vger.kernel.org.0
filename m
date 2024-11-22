Return-Path: <linux-kbuild+bounces-4799-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2219D62BE
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 18:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24C53160E5F
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 17:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AA81ABEB0;
	Fri, 22 Nov 2024 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2BO22uj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90C7080C;
	Fri, 22 Nov 2024 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295341; cv=none; b=b5QP+xPXhIZETMO81Y92UwqPvs+UU+W6fPKhFXvco/8gqIMmiudFV+EIOFprpnAoYQ//lUk3Li2RfJIt0uXXcS941VSvs6y4fX4/kSUgxi6X1zl209IGkO/iyfcEOkbSdqo2AZh5OBbvZYSey8pfwMKG1OmR82n4m93WCAYDANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295341; c=relaxed/simple;
	bh=1CfPCrbQSxmUjPMp+X9DvgffUWM1Ec0pXg1i9OP4r4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Km9ejHKoFUVcJPGvd9aXusncKhFT3BA/t72r6LgK1XOj62QX504JI+oxbb5y9wQtnzg+iW37KmshHww465o6DLEdQzsbAtj+Fl/IIcwJjYt0O0DT97yNSL8927WRuENjGhMnlxDHVcSo55iAAK5p4GWsFmqHqdwRM14M5aCRa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2BO22uj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFC6C4CECE;
	Fri, 22 Nov 2024 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732295340;
	bh=1CfPCrbQSxmUjPMp+X9DvgffUWM1Ec0pXg1i9OP4r4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2BO22ujt7JRhNwqpoS7ukt9qktB24LEqlLsR7koU2zcx3Nz9ZqK8KXxgjmYiB589
	 COor+H2gke1uqm5grSjNUgba5tmE6ueiGkeT/n+9FDqtnZxM/6CPTItGmStfZT1nnh
	 8GU200xN0goFcB/gTkq9Iu+YhKVoK6CWDGmY8dHUxsE6iai8p+P8vJv3s1kznZzZcG
	 yw+0tGB4Yi5tSJah9hoGhk49Fg8M5TxfHd++mqoRuL/OvQj1/bBGy9DY9TD2Zvh4R1
	 65316DPCtRqlf3fCCKSJGnnr0NY/gLWibHJg5GiYI2NRtuL0HRCUIg+6vGrLPE4Ik3
	 8M/MZGt8kGq9g==
Date: Fri, 22 Nov 2024 09:08:58 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeff King <peff@peff.net>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v4] setlocalversion: work around "git describe"
 performance
Message-ID: <20241122170858.s5ij6346twiq2spt@jpoimboe>
References: <20241122150037.1085800-1-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122150037.1085800-1-linux@rasmusvillemoes.dk>

On Fri, Nov 22, 2024 at 04:00:37PM +0100, Rasmus Villemoes wrote:
> v4:
> 
> - Switch the logic to make use of the return values from try_tag,
>   instead of asking whether $count has been set.
> 
> - Update a comment.
> 
> - Drop T-b tag from Josh as I think this changes the flow sufficiently
>   from the version he tested. I have repeated my tests, with the same
>   functional and performance result as indicated in the commit log.

Tested-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh


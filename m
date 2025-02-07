Return-Path: <linux-kbuild+bounces-5651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81126A2B945
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 03:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 886047A20FD
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 02:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652662BB13;
	Fri,  7 Feb 2025 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwbp80kO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8966AA7;
	Fri,  7 Feb 2025 02:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896690; cv=none; b=Xjz6w51pQKfFnh0MCCRWTSUByrg9JRNnnRw7iIkFz1gQ54oNUpvqikhpQvtKkrQgYTZ9Zb85+IU9jE1X7GgObgtY8BkGcPtmjJCi2xeafbO7dO5bmJY/9e6X+eqWHv8WrixBIgunV9wcFcsq+Tlyje2jmqYtqndeoBM5YoLWu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896690; c=relaxed/simple;
	bh=4S6PeHmwsE+ONoPMxvqDYFT9MsitLu/804rgTQaEzT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hc2+B+7Oi1dZnZbz7+Wzj9g/5vDlSmKfpFq2kis2ums2EOG92odgrXb8hk9cb9Q3GbfPJe07PkYIbOsEj75WDxje4C4tawYvoj1I+G5wa5X3lBK4kPU+5bZDEL+n5GmjYSSmsyEAIwQMBSQL/zZluBHeESzcOGJFOuUJs9HWJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwbp80kO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C07C4CEDD;
	Fri,  7 Feb 2025 02:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738896689;
	bh=4S6PeHmwsE+ONoPMxvqDYFT9MsitLu/804rgTQaEzT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwbp80kOrtEUPN+DL2rCVCIWp/3zEONtQrGDiy3L9klYRVUsM4NVLSLfZaAMZZSZO
	 +Gtp7V3tg/GEqJhoeC6vqCJkLR3cE9y7tjYSoUsng8hPIt5IXUXyXOYaI3odSfO13X
	 SCsw8pMQhuXGlVPyYEH93Ga9DubRGUs6sULXKIAEq+Qv6RKcbEMy9vVlcTBHKSH8dt
	 IYmvL+SXqT2dCAFBsC+6ryX8lHw5GQRULoVoJUI8uDiQxSnKWw+WxAZCpH/xigsuQi
	 LgR0Q2DzNfjkbB2Yyi121feYDuM0vkIGGM+JDTJhpmsdjjFXLTVti+H4CvWmRh0QNZ
	 8EhJInLy7DCFQ==
Date: Thu, 6 Feb 2025 18:51:27 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20250207025127.2sy74bhcu6wtbo6a@jpoimboe>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
 <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162>
 <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
 <20250131204920.GA1974131@ax162>
 <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>
 <20250206171036.GF180182@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206171036.GF180182@ax162>

On Thu, Feb 06, 2025 at 10:10:36AM -0700, Nathan Chancellor wrote:
> Right, I think gating on '!COMPILE_TEST' would not be a terrible way to
> introduce it. We would definitely want to remove that dependency as
> soon as possible because we want compile testers to be qble to find
> these problems and have them be noticeable but it should make the
> introduction of CONFIG_OBJTOOL_WERROR less disruptive.

I want to get CONFIG_OBJTOOL_WERROR merged soon.  I'm working on some
other patches to go along with it that will hopefully ease some of the
pain.  I'll post those soon and then hopefully we can get it into
linux-next.

I didn't quite follow the OBJTOOL_FLAGS idea.  We already have
OBJTOOL_ARGS which allows adding arguments (though not removing them),
was it mean to be something like that?

I agree we might want to ease into the pool with !COMPILE_TEST.

-- 
Josh


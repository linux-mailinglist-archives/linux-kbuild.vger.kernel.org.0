Return-Path: <linux-kbuild+bounces-5672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2EA2CFE6
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 22:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A94B1883CF3
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 21:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F7719DF44;
	Fri,  7 Feb 2025 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtNmAYwu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914D23C8CB;
	Fri,  7 Feb 2025 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738964478; cv=none; b=XHqTzY2B4qbQepOhVeQMra/TfRqK9d6DZynR3fgDkW+N60WKl4NPSeHiKLuPTusVsCVVETXUgLD1Z9ZmPgCOYxBu4WdkaTWjBkNHCZvPE1lpPfd0WuFHjr3ooQq/QRq14XLI4Pt/oxZJr2VlTa5gANs+UNSSuW7wZx0Y+ZbGv8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738964478; c=relaxed/simple;
	bh=bqBytptlQlI73yqYfMLj2ttbYFVky1pvmuVnq2C2jHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3Qn8SqMoEjQt+5j2leRHvjrM6GbVv7DFrJP3TpXnKmzGdy95dHxoxulIE3gQ267QPxzcloOcSUSlFx4kFQHo0wFeg7/6bDPZ2qh6o4oseIa5uWt3s4N9EQo1MSrcKSfHEcBYNmFRyLASKv2vDlH+Uy+/E91WcUzZKe2rSgbJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtNmAYwu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DD0C4CED1;
	Fri,  7 Feb 2025 21:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738964478;
	bh=bqBytptlQlI73yqYfMLj2ttbYFVky1pvmuVnq2C2jHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtNmAYwul23XH0zCg2ocs+olF6xs3OWFogWmnRQH6KXquwcmduMhunb+CYcrGRZIU
	 Png6QHlNUBRlsq3XbaVCOQV3fMt8qbLdd9j35K0KDCto0QpAbmOyetSSMbXJqBZljM
	 dVxU3/t2z06NfEnMVaI2/9zJMPeqCQLR/gASA3SuR+8sT84xmXUKkL2BUbfWu1zuJI
	 ohaQ+oIInjT0SzVPfjtiJm3a5OIBJrxZJdF4hMpGx55Xh4T3RCBgTmAS2ZU38Ok0ER
	 W7UdvYLlXAyg9ZyIE/t7+kbCyYTHblN/IBZ7CSCJjaXMCLDGcSb+o/YIeLV/9K9Wvm
	 OgWJb324GuRyQ==
Date: Fri, 7 Feb 2025 14:41:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20250207214113.GB661404@ax162>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
 <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162>
 <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
 <20250131204920.GA1974131@ax162>
 <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>
 <20250206171036.GF180182@ax162>
 <20250207025127.2sy74bhcu6wtbo6a@jpoimboe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207025127.2sy74bhcu6wtbo6a@jpoimboe>

On Thu, Feb 06, 2025 at 06:51:27PM -0800, Josh Poimboeuf wrote:
> On Thu, Feb 06, 2025 at 10:10:36AM -0700, Nathan Chancellor wrote:
> > Right, I think gating on '!COMPILE_TEST' would not be a terrible way to
> > introduce it. We would definitely want to remove that dependency as
> > soon as possible because we want compile testers to be qble to find
> > these problems and have them be noticeable but it should make the
> > introduction of CONFIG_OBJTOOL_WERROR less disruptive.
> 
> I want to get CONFIG_OBJTOOL_WERROR merged soon.  I'm working on some
> other patches to go along with it that will hopefully ease some of the
> pain.  I'll post those soon and then hopefully we can get it into
> linux-next.

Sounds good to me, getting it into linux-next will give us a good idea
of how disruptive it may be.

> I didn't quite follow the OBJTOOL_FLAGS idea.  We already have
> OBJTOOL_ARGS which allows adding arguments (though not removing them),
> was it mean to be something like that?

Yes, I should have prefaced "if it does not already exist" since I did
not realize that there was already support for adding to objtool
arguments via an environment/make variable already.

Cheers,
Nathan


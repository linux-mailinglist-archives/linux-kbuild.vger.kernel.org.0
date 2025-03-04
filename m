Return-Path: <linux-kbuild+bounces-5954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B3A4DEAA
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 14:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C624176B75
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 13:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73BB203711;
	Tue,  4 Mar 2025 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3Cj0Iu5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9551FF7AE;
	Tue,  4 Mar 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093614; cv=none; b=MInBxJhnQgNG22VewRqt2WXbWST+Ux4ibPOwzgQLD/h+2lYPeCMZiYke+2ULDBsLdARN8wWt3urAGW9e+7AODpgQExIMU8z5U9IjtWX7wPzJYZANSYqjto7WUvpSDTeBBM5EVANEISOlNwy+Hg0TeMZ8VWJs7YpWsJ2H7nMZdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093614; c=relaxed/simple;
	bh=pHSz09iNcjxLjQhcs9B/mcpQH839SIy3BkVhtEt1c1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oM3SYOnBglFmeOdp+1ury6HUFW+yd2fimxP9khQYMZdNkfAEIo1Pa6vhkxKWbe/LjaxdwZZwK9rfjngqUu6sGxlwNstIIiNM7ciDHH6vO4doH+UkLQoMt8NM+Y3kq518+mA2nF9o4loIa3ATHwIzOpMw3H/xPUZbe/C8yvoRyZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3Cj0Iu5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BA0C4CEE5;
	Tue,  4 Mar 2025 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741093613;
	bh=pHSz09iNcjxLjQhcs9B/mcpQH839SIy3BkVhtEt1c1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3Cj0Iu5ONRQ7mlexTrvEG19NljSPjUlaLx3SNbwyl+sZG4c56xKD3wv8ArXLssmT
	 HwUna2K6QIFAc2Azw69M32cZpXIBxUxTrszVC/6hhT6iGs1bs1CVD/4OOknteMzpHO
	 C3pujDMaNRrGgzxlOzpiOmcoxQzTmnJKbJPN0nkv+UfHVHeclTP0qEetf4nsjhk8HR
	 olAA2uOuQ2TLW70QuE6fn6Pb67FtqnOCJL2ixJXFzq8VzCM/U2SfacBNFInlw9DHKL
	 wHs3v4zbBFu3O3I4prsob3cEtxOwscNQXROV/I1JaLY2WGQD2OZgKHhzap5cgwZrxU
	 v+xHr1lOUvj+Q==
Date: Tue, 4 Mar 2025 14:06:48 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Message-ID: <20250304130648.GA3922496@ax162>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
 <Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>
 <Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>
 <Z8Zu0p2vCAfwXa/L@dev-ushankar.dev.purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8Zu0p2vCAfwXa/L@dev-ushankar.dev.purestorage.com>

Hi Uday,

On Mon, Mar 03, 2025 at 08:09:06PM -0700, Uday Shankar wrote:
> On Mon, Feb 24, 2025 at 12:35:00PM -0700, Uday Shankar wrote:
> > On Mon, Feb 17, 2025 at 07:27:06PM -0700, Uday Shankar wrote:
> > > ping
> > 
> > ping again
> 
> ping again again. Can someone please take a look at this and/or let me
> know if I'm missing any recipients or if I'm expecting feedback too
> soon?

Your recipients list looks correct to me but I am not super
knowledgeable about the RPM format so I am not sure I can give this a
proper review but I will try to take a look at it when I can find some
time to do some research. Masahiro will be the one to pick this up but
some maintainers are busier than others.

Cheers,
Nathan


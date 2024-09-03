Return-Path: <linux-kbuild+bounces-3353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2696A7CD
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 21:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBD8D1C241E3
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 19:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224771DC738;
	Tue,  3 Sep 2024 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="fc0tIMct"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857581DC722;
	Tue,  3 Sep 2024 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725393151; cv=none; b=QHLxetiMwm74rfz6nc4kOuaMdGW8LfnCRabAq5jUFbGr8iBBmjd1GAY/6GwguAxNX3jAiJq8/vij0/VRkocfl/U8QxVJGTnnLNyRwAdJqNcApB6bPlIEgZ4SdH2CBKaJ3pjrkIcRN8dPCS5gIwd5J10niY1kuqOwi0h1Pmtz5VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725393151; c=relaxed/simple;
	bh=1c4c/EKGO0oUf65xGgDCQAVKfig8j13NSd8PuzUeHro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1cgSaYAfL11A95nQ/eYHIEJFZzOdi3+qKFNPwcD+Pez4oLf/bNOUPs5sF/a/5WkF/KmGUgwPyDZLsIkbD+FeiQC4gWMXotUy9NE2pKqBNGHlVxWdgpTrHk6mRX9TCIt16zQTdbPTY1Vo+ZABIIXdoMpkkcfHOUtbFAntutDta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=fc0tIMct; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cv7xuHbOtM8xIXLcnXYFtBzxBQc1aPp7NapeVyzdP4I=; b=fc0tIMct+Tg3sr+SUtOnMwNGtr
	UhSXkvdgPCCjgHKaUqkzAkJJNzDmV/mBG+l/sWR/VYwew8JS9/kcFqnXzjD7m2AeE3X1a5+JRDCpg
	trWmXFdI2rlWU0v8gokPkFNU8l5YhCP5hDtQtL/VA0o3r//LachpF/f9wKPAjrlgtCiVJTh7QQT5d
	iY547QQseRoOrPpM5Lll9fTvUIe34GGwAQ3CvB0iTIOGLX/CnnXueOzYygB0fgA7l5pbw+tL3sI3X
	/MrPy0l7ig8gso6/kYBx3vn6OztvUjCiTpsU3OBynn86NskEFQPfRfhHxbml8eStiUq/04X37TTC1
	5iQi/qKw==;
Received: from [2001:9e8:9e4:e501:3235:adff:fed0:37e6] (port=50610 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1slZZU-00ElPq-EQ;
	Tue, 03 Sep 2024 21:52:12 +0200
Date: Tue, 3 Sep 2024 21:52:07 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: pahole-version: improve overall checking and
 error messages
Message-ID: <20240903-amorphous-impartial-gharial-e8bac8@lindesnes>
References: <20240902160828.1092891-1-ojeda@kernel.org>
 <CANiq72kV90EjHGitEVO4GQFYtQJZ_3-1rkXJnOwez7u7Ph+Z3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kV90EjHGitEVO4GQFYtQJZ_3-1rkXJnOwez7u7Ph+Z3g@mail.gmail.com>

On Mon, Sep 02, 2024 at 06:12:52PM +0200, Miguel Ojeda wrote:
> On Mon, Sep 2, 2024 at 6:09 PM Miguel Ojeda <ojeda@kernel.org> wrote:
> >
> > +if ! command -v "$@" >/dev/null; then
> > +       echo >&2 "***"
> > +       echo >&2 "*** pahole '$@' could not be found. pahole will not be used."
> > +       echo >&2 "***"
> > +       exit 1
> > +fi
> 
> We may not want to print a warning in this case if this case/setup is
> too common, though.

yes, I think it's a good idea to skip to remove this one.

Kind regards,
Nicolas


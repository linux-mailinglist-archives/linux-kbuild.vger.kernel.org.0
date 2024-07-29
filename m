Return-Path: <linux-kbuild+bounces-2718-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1908393EFF5
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 10:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC09C281215
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 08:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C155E091;
	Mon, 29 Jul 2024 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ivE5YY4+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1C713B299
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2024 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722242080; cv=none; b=jpv/0jmv54yF2DX0JKsVO69WVjkEFbQTW3xrVEXwbBNN8VwdUAPOTG6hw0/x9GlIEk530+QqoLIAwcSlNomHpsZyPwt7hd1gfe0SlxE0pcrS5JZKLZjokrL3QFabg7uEbVpE0/MaxdCi6i2Qmh8Dv+E86DyMs4YaQQM+RSRs17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722242080; c=relaxed/simple;
	bh=nuG/4vNf+Xo0PuptBC7376G+xBvvSdFJWnxk+gys6MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMRV99S5Zl9tRKcVrUSx8CYoqe6+YbCLRVyBXQ3+fPsCkZvKSmfB26RR+6iHYu1jsJEiexw23ho0jL0o3SXWs0vtR2ggSrIpdLPFWYGcxEoDyslekIFyGSZTCt4p8RYkhh7qyTW9UOCz3ixfTnl7eXnrLelUQ+VlyoX6c8WFVBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ivE5YY4+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722242076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQiICJ5lL4LLRuRe82xJT7UDszv9VsNI9xZ/zp+jqc8=;
	b=ivE5YY4+CNrQool+I3sReEdWvNmnpbMoRyyAFtvAFCuXswqiv1DgkwCPSKW6y0r+kkvGcP
	wi7UDk9OZdplk22lFB275/DfgK0n8CdVwh0Nm53yVVGaIl5Xc7tq39IIQXaQpGGw/dzYs7
	/AJor8f/zDXas4S1UL2tJliGA8j/5JA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-fp6fsfEAMraFMdT2FWJpgA-1; Mon,
 29 Jul 2024 04:34:33 -0400
X-MC-Unique: fp6fsfEAMraFMdT2FWJpgA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46EC61955BED;
	Mon, 29 Jul 2024 08:34:30 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.136])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 599B71955D48;
	Mon, 29 Jul 2024 08:34:22 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: dsimic@manjaro.org
Cc: UNGLinuxDriver@microchip.com,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	f.fainelli@gmail.com,
	gregkh@linuxfoundation.org,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	lucas.demarchi@intel.com,
	masahiroy@kernel.org,
	mcgrof@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy module
Date: Mon, 29 Jul 2024 10:34:19 +0200
Message-ID: <20240729083421.11203-1-jtornosm@redhat.com>
In-Reply-To: <b8a2831c4f2d49469d5af04c03bb1a5b@manjaro.org>
References: <b8a2831c4f2d49469d5af04c03bb1a5b@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hello Dragan,

> Quite frankly, all this makes me wonder why weakdeps were merged into
> the mainline kernel [1] with no real consumers?  Perhaps this is good
> time for Jose and Luis to chime in.
Well, I requested this commenting as an example the case of lan78xx and
the possible phy modules,  becasue it is clearly failing when initramfs
is generated due to the dynamic phy module loading process.
In my opinion this example was enough good because I found it difficult get
an automatic way to get this information in advance for all the cases and
becasue I need to fix this initramfs issue.

But with a first glance, I also found several examples (not phy related),
in which it seems the suitable softdep was added to solve the initramfs
missing module issue:
80f4e62730a9 drm/panfrost: Mark simple_ondemand governor as softdep
0c94f58cef31 drm/lima: Mark simple_ondemand governor as softdep
2ebe16155dc8 scsi: ufs: core: Add soft dependency on governor_simpleondemand
dfe085d8dcd0 crypto: xts - Add softdep on ecb
...

Therefore, I requested to provide this  kind of new dependency (weakdep)
first in general, becasue I thought it could be useful for a lot of cases
not only for the unkown (for initramfs) phy modules (i.e. lan78xx).
That is, in spite of the initial usage has been rejected, I think it can
still be considered by the other commented examples (or new ones).
I would like to confirm some example(s) to have some usage, but this will
need to be from September after my holidays.

Thanks

Best regards
José Ignacio



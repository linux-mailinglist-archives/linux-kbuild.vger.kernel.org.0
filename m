Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65187C94B0
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 01:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbfJBXQI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 19:16:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42676 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbfJBXQI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 19:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=+Jc6VAq2RVRA15SgYl559gtU9HYlPAnAB7vPjMQym6I=; b=dn0/k5m4s4CuFAi+Km9aYOmJN
        3Fz67CeXW/BofcyHDGRVpU+6ey2KNnWsXSfmkAxeSH/pXXKvKMpepy+trK7buizLsTe7fieIaulvD
        5LaFuhzGewLYqyDY25sRx5rXzdquZDktIFa5gzDxKyfIgEXls5ajBScZkSc6+7pABWuhy2dfPFANR
        95fmb9TMOpEeV/i3H02zJdmWZkaxOo6b/sFvAiY3JBp5NOdQ+SmhSo9m/QoLN5JJrWXeX4LHQjm5O
        LYi/4DkaN2cK58FfrHfzQNbhAleNG0AHs1X5PGqwRvQYS9XoG3imgZKiovSvEcyzdZQyRD7ByA0bc
        bVf9f15Lg==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFnqp-0007jN-U6; Wed, 02 Oct 2019 23:16:08 +0000
To:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: 'make help' br0ken for @echo ' valid values for SPHINXDIRS are:
 $(_SPHINXDIRS)'
Message-ID: <416a61e8-e40a-6266-3f6a-bdbadf9a10c3@infradead.org>
Date:   Wed, 2 Oct 2019 16:16:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It seems that _SPHINXDIRS is empty.  I'm getting (short extract):

  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2
  valid values for SPHINXDIRS are: 

  make SPHINX_CONF={conf-file} [target] use *additional* sphinx-build
  configuration. This is e.g. useful to build with nit-picking config.

  Default location for the generated documents is Documentation/output


-- 
~Randy

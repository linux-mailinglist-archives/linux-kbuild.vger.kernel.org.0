Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33EC34EB5
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 19:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfFDR0B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 13:26:01 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:34819 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfFDR0B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 13:26:01 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 48212200B5;
        Tue,  4 Jun 2019 19:25:55 +0200 (CEST)
Date:   Tue, 4 Jun 2019 19:25:53 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] kbuild: add support for ensuring headers are
 self-contained
Message-ID: <20190604172553.GA2383@ravnborg.org>
References: <20190604101409.2078-14-yamada.masahiro@socionext.com>
 <20190604124248.5564-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604124248.5564-1-jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=taGs_qngAAAA:8
        a=c-n4J4-pAAAA:8 a=NZ-89VFvAAAA:8 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8
        a=92KSPt4HXbW4kmdNYy0A:9 a=CjuIK1q_8ugA:10 a=DM_PlaNYpjARcMQr2apF:22
        a=L0NDqeB7ZLmQzAogN4cw:22 a=pm31WBKQz9GEXVZSZ1ft:22
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 04, 2019 at 03:42:48PM +0300, Jani Nikula wrote:
> Sometimes it's useful to be able to explicitly ensure certain headers
> remain self-contained, i.e. that they are compilable as standalone
> units, by including and/or forward declaring everything they depend on.
> 
> Add special target header-test-y where individual Makefiles can add
> headers to be tested if CONFIG_HEADER_TEST is enabled. This will
> generate a dummy C file per header that gets built as part of extra-y.
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks good, thanks.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


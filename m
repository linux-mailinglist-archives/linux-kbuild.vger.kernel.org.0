Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E43A34F65
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 19:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfFDR5L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 13:57:11 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:35511 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfFDR5L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 13:57:11 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 187922004D;
        Tue,  4 Jun 2019 19:57:08 +0200 (CEST)
Date:   Tue, 4 Jun 2019 19:57:06 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 01/15] kbuild: remove headers_{install,check}_all
Message-ID: <20190604175706.GA4093@ravnborg.org>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
 <20190604101409.2078-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604101409.2078-2-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=A-kqMh_e01oG-bl_YbUA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 04, 2019 at 07:13:55PM +0900, Masahiro Yamada wrote:
> headers_install_all does not make much sense any more because different
> architectures export different set of uapi/linux/ headers. As you see
> in include/uapi/linux/Kbuild, the installation of a.out.h, kvm.h, and
> kvm_para.h is arch-dependent. So, headers_install_all repeats the
> installation/removal of them.
> 
> If somebody really thinks it is useful to do headers_install for all
> architectures, it would be possible by small shell-scripting, but the
> top Makefile do not have to provide entry targets just for that purpose.
Agreed, good to see this be dropped.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

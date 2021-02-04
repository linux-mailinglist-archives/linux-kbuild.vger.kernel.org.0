Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256B930C12C
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 15:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhBBOPK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 09:15:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:46178 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234199AbhBBONL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 09:13:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 651E4B11D;
        Tue,  2 Feb 2021 14:12:29 +0000 (UTC)
Date:   Tue, 2 Feb 2021 15:12:28 +0100 (CET)
From:   Miroslav Benes <mbenes@suse.cz>
To:     Christoph Hellwig <hch@lst.de>
cc:     Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 12/13] module: remove EXPORT_SYMBOL_GPL_FUTURE
In-Reply-To: <20210202121334.1361503-13-hch@lst.de>
Message-ID: <alpine.LSU.2.21.2102021511380.570@pobox.suse.cz>
References: <20210202121334.1361503-1-hch@lst.de> <20210202121334.1361503-13-hch@lst.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2 Feb 2021, Christoph Hellwig wrote:

> As far as I can tell this has never been used at all, and certainly
> not any time recently.

Right, I've always wondered about this one.
 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Miroslav Benes <mbenes@suse.cz>

M
